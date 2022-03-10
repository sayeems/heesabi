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
            entities = await strapi.services.list.find({
                _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users.id': ctx.state.user.id }] }
            });
        }

        return entities.map(entity => sanitizeEntity(entity, { model: strapi.models.list }));
    },

    async findOne(ctx) {
        const { id } = ctx.params;

        const entity = await strapi.services.list.findOne({
            id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users.id': ctx.state.user.id }] }
        });
        if (!entity) {
            return ctx.unauthorized(`You don't have permission`);
        }
        return sanitizeEntity(entity, { model: strapi.models.list });
    },

    async create(ctx) {
        let entity;

        //check access level
        const [account] = await strapi.services.account.find({
            id: ctx.request.body.account,
            _where: { _or: [{ 'owner': ctx.state.user.id }, { 'users.id': ctx.state.user.id }] }
        });

        if (!account) {
            return ctx.unauthorized(`You are not permitted to perform this action`);
        }


        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            data.list.author = ctx.state.user.id;
            entity = await strapi.services.list.create(data, { files });
        } else {
            ctx.request.body.author = ctx.state.user.id;
            entity = await strapi.services.list.create(ctx.request.body);
        }
        return sanitizeEntity(entity, { model: strapi.models.list });
    },

    async update(ctx) {
        const { id } = ctx.params;

        let entity;

        //check authority
        const [account] = await strapi.services.list.find({
            id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });

        if (!account) {
            return ctx.unauthorized(`You can't update this entry`);
        }

        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            entity = await strapi.services.list.update({ id }, data, {
                files,
            });
        } else {
            entity = await strapi.services.list.update({ id }, ctx.request.body);
        }

        return sanitizeEntity(entity, { model: strapi.models.list });
    },

    async delete(ctx) {
        const { id } = ctx.params;

        //deleting a list should also delete all it's items

        let entity, deletItems;

        let currentState = await strapi.services.list.findOne({ id });

        if (!currentState) {
            return ctx.unauthorized(`You can't delete this entry`);
        }

        const [account] = await strapi.services.list.find({
            id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });

        if (!account) {
            return ctx.unauthorized(`You can't delete this entry`);
        }

        if (account.items.length > 0) {
            account.items.map(async (single) => {
                let { id } = single;
                try {
                    deletItems = await strapi.services.item.delete({ id });
                }
                catch (error) {
                    console.log(error);
                }
            });
        }
        entity = await strapi.services.list.delete({ id });
        return sanitizeEntity(entity, { model: strapi.models.list });
    },

    count(ctx) {
        if (ctx.query._q) {
            return ctx.unauthorized(`You are unauthorized`);
        }
        return strapi.services.list.count({
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });
    },
};
