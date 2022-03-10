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
            entities = await strapi.services.account.find({
                _where: { _or: [{ 'owner': ctx.state.user.id }, { 'users.id': ctx.state.user.id }] }
            });
        }

        return entities.map(entity => sanitizeEntity(entity, { model: strapi.models.account }));
    },

    async findOne(ctx) {
        const { id } = ctx.params;

        const entity = await strapi.services.account.findOne({
            id,
            _where: { _or: [{ 'owner': ctx.state.user.id }, { 'users.id': ctx.state.user.id }] }
        });
        if (!entity) {
            return ctx.unauthorized(`You don't have permission`);
        }
        return sanitizeEntity(entity, { model: strapi.models.account });
    },

    async create(ctx) {
        let entity;
        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            data.owner = ctx.state.user.id;
            entity = await strapi.services.account.create(data, { files });
        } else {
            ctx.request.body.owner = ctx.state.user.id;
            entity = await strapi.services.account.create(ctx.request.body);
        }
        return sanitizeEntity(entity, { model: strapi.models.account });
    },

    async update(ctx) {
        const { id } = ctx.params;

        let entity;

        const [account] = await strapi.services.account.find({
            id: ctx.params.id,
            _where: { _or: [{ 'owner': ctx.state.user.id }, { 'users.id': ctx.state.user.id }] }
        });

        if (!account) {
            return ctx.unauthorized(`You can't update this entry`);
        }

        if (ctx.is('multipart')) {
            const { data, files } = parseMultipartData(ctx);
            entity = await strapi.services.account.update({ id }, data, {
                files,
            });
        } else {
            entity = await strapi.services.account.update({ id }, ctx.request.body);
        }

        return sanitizeEntity(entity, { model: strapi.models.account });
    },

    async delete(ctx) {
        const { id } = ctx.params;

        let entity;

        const [account] = await strapi.services.account.find({
            id: ctx.params.id,
            'owner': ctx.state.user.id,
        });

        if (!account) {
            return ctx.unauthorized(`You can't delete this entry`);
        }

        entity = await strapi.services.account.delete({ id });
        return sanitizeEntity(entity, { model: strapi.models.account });
    },

    count(ctx) {
        if (ctx.query._q) {
            return ctx.unauthorized(`You are unauthorized`);
        }
        return strapi.services.account.count({ _where: { _or: [{ 'owner': ctx.state.user.id }, { 'users.id': ctx.state.user.id }] } });
    },

    countown(ctx) {
        if (ctx.query._q) {
            return ctx.unauthorized(`You are unauthorized`);
        }
        return strapi.services.account.count({ 'owner': ctx.state.user.id });
    },
};
