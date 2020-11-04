Return-Path: <SRS0=Q74q=EK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437E4C4741F
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 21:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA7872083B
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 21:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604524028;
	bh=HJU6AfTgzeF+ibJnL5821K4v20j2Ob2vNl2mx60Ml20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=aReIVzNd8tmSeB4EYB+JAG2qmP7At6xZib1O0IcZrTHiMFZ1lcGAqMrKN3YLC3bqX
	 u9b0EUily0kzN+RzuVU9dK0Yzw+9nKO7P3wG4Gtok57brgTLECdBioT6bQA4XmrVgi
	 JRWTSYZJjZPTWBEEg+mdMLxVfzoVlqGUvs5OrZ3s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730888AbgKDVHG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 4 Nov 2020 16:07:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:36824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729141AbgKDVHF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Nov 2020 16:07:05 -0500
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB070207BB;
        Wed,  4 Nov 2020 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604524025;
        bh=HJU6AfTgzeF+ibJnL5821K4v20j2Ob2vNl2mx60Ml20=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NzeYycSpSU/k9iKKBzh8UN1vSfKqfjuL6L1O/CVaVS/Ty1lNvTn3jHZtZ/1bIaAI7
         kSxS2yTZRdEnhuU2XYSCMcxZlM87p3tPLkDmP3XPnRVaFTQ33seXNpd1SI1MqI3HiO
         YEa1H67vd7HmGsItrPT7ZPpdS5GhHqs6A1qXUjMg=
Date:   Wed, 4 Nov 2020 13:07:04 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Hayes Wang <hayeswang@realtek.com>
Subject: Re: [PATCH net-next 3/5] r8152: add MCU typed read/write functions
Message-ID: <20201104130704.3f91d343@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201104121424.th4v6b3ucjhro5d3@skbuf>
References: <20201103192226.2455-1-kabel@kernel.org>
        <20201103192226.2455-4-kabel@kernel.org>
        <20201103214712.dzwpkj6d5val6536@skbuf>
        <20201104065524.36a85743@kernel.org>
        <20201104084710.wr3eq4orjspwqvss@skbuf>
        <20201104112511.78643f6e@kernel.org>
        <20201104113545.0428f3fe@kernel.org>
        <20201104110059.whkku3zlck6spnzj@skbuf>
        <20201104121053.44fae8c7@kernel.org>
        <20201104121424.th4v6b3ucjhro5d3@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Nov 2020 14:14:24 +0200 Vladimir Oltean wrote:
> To my eyes this is easier to digest.

+1
