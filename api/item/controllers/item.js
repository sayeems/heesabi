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
            entities = await strapi.services.item.find({
                'author': ctx.state.user.id,
            });
        }

        return entities.map(entity => sanitizeEntity(entity, { model: strapi.models.item }));
    },

    async findOne(ctx) {
        const { id } = ctx.params;

        const entity = await strapi.services.item.findOne({
            id,
            'author': ctx.state.user.id,
        });
        if (!entity) {
            return ctx.unauthorized(`You don't have permission`);
        }
        return sanitizeEntity(entity, { model: strapi.models.item });
    },

    async create(ctx) {
        let entity, updatedTotal;

        //check list existance
        const [list] = await strapi.services.list.find({
            id: ctx.request.body.list,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });

        if (!list) {
            return ctx.unauthorized(`You are not permitted to perform this action`);
        }

        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            data.item.author = ctx.state.user.id;
            entity = await strapi.services.item.create(data, { files });
        } else {
            ctx.request.body.author = ctx.state.user.id;
            if (ctx.request.body.price && ctx.request.body.price > 0) {
                updatedTotal = list.total + ctx.request.body.price;
            } else {
                updatedTotal = list.total;
            }
            const updateListTotal = await strapi.services.list.update({ id: ctx.request.body.list }, { total: updatedTotal });
            entity = await strapi.services.item.create(ctx.request.body);
        }
        return sanitizeEntity(entity, { model: strapi.models.item });
    },

    async update(ctx) {
        const { id } = ctx.params;

        let entity, updatedTotal;

        //check items existance
        const [item] = await strapi.services.item.find({ id });
        if (!item) {
            return unauthorized(`You are not permitted to perform this action`);
        }

        //check authority
        const [list] = await strapi.services.list.find({
            id: item.list.id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });

        if (!list) {
            return ctx.unauthorized(`You are not permitted to perform this action`);
        }

        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            entity = await strapi.services.item.update({ id }, data, {
                files,
            });
        } else {
            if (ctx.request.body.price && ctx.request.body.price !== item.price) {
                updatedTotal = list.total - (item.price - ctx.request.body.price);
            } else {
                updatedTotal = list.total;
            }
            const updateListTotal = await strapi.services.list.update({ id: list.id }, { total: updatedTotal });
            entity = await strapi.services.item.update({ id }, ctx.request.body);
        }

        return sanitizeEntity(entity, { model: strapi.models.item });
    },

    async delete(ctx) {
        const { id } = ctx.params;

        let entity, updatedTotal;

        //check items existance
        const [item] = await strapi.services.item.find({ id });
        if (!item) {
            return unauthorized(`You are not permitted to perform this action`);
        }

        //check authority
        const [list] = await strapi.services.list.find({
            id: item.list.id,
            _where: { _or: [{ 'account.owner': ctx.state.user.id }, { 'account.users': ctx.state.user.id }] }
        });

        if (!list) {
            return ctx.unauthorized(`You are not permitted to perform this action`);
        }

        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            entity = await strapi.services.item.delete({ id }, data, {
                files,
            });
        } else {
            updatedTotal = list.total - item.price;
            const updateListTotal = await strapi.services.list.update({ id: list.id }, { total: updatedTotal });
            entity = await strapi.services.item.delete({ id });
        }

        return sanitizeEntity(entity, { model: strapi.models.item });
    },

    count(ctx) {
        if (ctx.query._q) {
            return ctx.unauthorized(`You are unauthorized`);
        }
        return strapi.services.item.count({
            'author': ctx.state.user.id,
        });
    },

};
