'use strict';
const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
    async find(ctx) {
        let entities;

        if (ctx.query._q) {
            return ctx.unauthorized(`You are unauthorized`);
        }
        else {
            entities = await strapi.services.debit.find({
                _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users.id': ctx.state.user.id }] }
            });
        }

        return entities.map(entity => sanitizeEntity(entity, { model: strapi.models.debit }));
    },

    async findOne(ctx) {
        const { id } = ctx.params;

        const entity = await strapi.services.debit.findOne({
            id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users.id': ctx.state.user.id }] }
        });
        if (!entity) {
            return ctx.unauthorized(`You don't have permission`);
        }
        return sanitizeEntity(entity, { model: strapi.models.debit });
    },

    async create(ctx) {
        let entity, updateAccount;

        //check request validity
        const [account] = await strapi.services.account.find({
            id: ctx.request.body.account,
            _where: { _or: [{ 'owner': ctx.state.user.id }, { 'users.id': ctx.state.user.id }] }
        });

        if (!account) {
            return ctx.unauthorized(`You are not permitted to perform this action`);
        }

        const { id } = account;
        let newBalance = account.balance - ctx.request.body.amount;


        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            data.debit.author = ctx.state.user.id;
            entity = await strapi.services.debit.create(data, { files });
        } else {
            ctx.request.body.author = ctx.state.user.id;
            entity = await strapi.services.debit.create(ctx.request.body);
            updateAccount = await strapi.services.account.update({ id }, { "balance": newBalance });
        }
        return sanitizeEntity(entity, { model: strapi.models.debit });
    },

    async update(ctx) {
        const { id } = ctx.params;

        let entity, newBalance = 0, updateAccount;

        const [account] = await strapi.services.debit.find({
            id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });

        if (!account) {
            return ctx.unauthorized(`You can't update this entry`);
        }

        let currentState = await strapi.services.debit.findOne({ id });

        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            entity = await strapi.services.debit.update({ id }, data, {
                files,
            });
        } else {
            entity = await strapi.services.debit.update({ id }, ctx.request.body);
            if (ctx.request.body.amount && ctx.request.body.amount !== currentState.amount) {
                const { id } = account;
                newBalance = account.balance - (ctx.request.body.amount - currentState.amount);
                const updateAccount = await strapi.services.account.update({ id }, { "balance": newBalance });
            }
        }

        return sanitizeEntity(entity, { model: strapi.models.debit });
    },

    async delete(ctx) {
        const { id } = ctx.params;

        let entity;

        let currentState = await strapi.services.debit.findOne({ id });

        if (!currentState) {
            return ctx.unauthorized(`You can't delete this entry`);
        }

        const [account] = await strapi.services.account.find({
            id: currentState.account.id,
            'owner': ctx.state.user.id,
        });

        if (!account) {
            return ctx.unauthorized(`You can't delete this entry`);
        }

        entity = await strapi.services.debit.delete({ id });
        const updateAccount = async () => {
            let newBalance = account.balance + currentState.amount;
            let { id } = account;
            const updateBalance = await strapi.services.account.update({ id }, { "balance": newBalance });
        }
        updateAccount();
        return sanitizeEntity(entity, { model: strapi.models.debit });
    },

    count(ctx) {
        if (ctx.query._q) {
            return ctx.unauthorized(`You are unauthorized`);
        }
        return strapi.services.debit.count({ 'author': ctx.state.user.id });
    },
};
