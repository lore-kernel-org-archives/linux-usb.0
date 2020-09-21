Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817E6C43469
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 12:55:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C53921789
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600692905;
	bh=YTX2FUJMA61MC//Hyghreyy7urvRmhmEcVuSrJ8McWM=;
	h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:List-ID:
	 From;
	b=hgxggzFR3qpC8oTuR0WkJe8avcZwT6DUUlVQKfclb3WwKcVwPJ9GXspHwugc7ZkUe
	 r2UnEIDlVz5fI2bJgsQGRhdU6mFjMwUMQzibm25e05j/DZhDp/cO9MpOE0xckO4iiI
	 o0J+ZhTeAhA5SM+OIG8gvNOKQtfRlzm2QQHmyrJU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgIUMzE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727055AbgIUMy5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 08:54:57 -0400
Received: from localhost (unknown [70.37.104.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE4D820874;
        Mon, 21 Sep 2020 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600692897;
        bh=YTX2FUJMA61MC//Hyghreyy7urvRmhmEcVuSrJ8McWM=;
        h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
        b=AHPyzCgt7OZRRAmzWC8DQLDp676gZONzrkI5OZ6OEb6kwTF3+fNv+HhEJSKdmo/6A
         Foot9lpFJrIFkuOWDGIHCsfrYR/YSsbQQU7H2eUt1L+FDTqqyQbkxmr18sC3KZat2c
         K4ShI68ieWiuJC6bvwiM0Y0N020CWndUEyNhiaew=
Date:   Mon, 21 Sep 2020 12:54:56 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH 09/10] xhci: don't create endpoint debugfs entry before ring buffer is set.
In-Reply-To: <20200918131752.16488-10-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-10-mathias.nyman@linux.intel.com>
Message-Id: <20200921125456.EE4D820874@mail.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 02b6fdc2a153 ("usb: xhci: Add debugfs interface for xHCI driver").

The bot has tested the following trees: v5.8.10, v5.4.66, v4.19.146.

v5.8.10: Build OK!
v5.4.66: Build OK!
v4.19.146: Failed to apply! Possible dependencies:
    5afa0a5ed3da ("usb: xhci: add endpoint context tracing when an endpoint is added")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
