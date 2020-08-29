Return-Path: <SRS0=c3nw=CH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D2EC433E7
	for <linux-usb@archiver.kernel.org>; Sat, 29 Aug 2020 21:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 240F920B80
	for <linux-usb@archiver.kernel.org>; Sat, 29 Aug 2020 21:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598738367;
	bh=AwqrBIZw5KX2ayK75ienwO2870kPL8L22VWURdkChoI=;
	h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
	 References:List-ID:From;
	b=sQFl5pkC8Vyfy5TWfrcm8IRtFUWb0cDSgoxzN2agmKyQwPBDfHxQF0lYjv4Zhm5P5
	 qzfMHDGmDHEM8daJDkuWgMUCLecIw/mjYFcfk9EyEtYs3Z3Hzp2FQyAsml0UoMTEjd
	 vmarNz54JtxaIcdXjKZTZv56FpR3ktoi8Iz1WLb8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgH2V70 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 29 Aug 2020 17:59:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:49030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbgH2V7Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 29 Aug 2020 17:59:25 -0400
Received: from localhost (unknown [70.37.104.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 304F32076D;
        Sat, 29 Aug 2020 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598738365;
        bh=AwqrBIZw5KX2ayK75ienwO2870kPL8L22VWURdkChoI=;
        h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
         References:From;
        b=Mqs6MDtb6wArtvdDmUK/918NPXbCOCy5vASvscF7ipg5its8bJKelkcTqD1lqW/pU
         Ng0pWlsoNBD9wzddyki62Fr5/ESHh2XZI6QacpqJeKKp2M7PkNIifzV+czBsBVQmKb
         wKI7TMr05cbOidKyK8QHjHfBaB5B31pctGu6ScrQ=
Date:   Sat, 29 Aug 2020 21:59:24 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Cc:     AceLan Kao <acelan.kao@canonical.com>
Cc:     Sebastian Sjoholm <ssjoholm@mac.com>
Cc:     Dan Williams <dcbw@redhat.com>
Cc:     stable@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: support dynamic Quectel USB compositions
In-Reply-To: <20200829134250.59118-1-bjorn@mork.no>
References: <20200829134250.59118-1-bjorn@mork.no>
Message-Id: <20200829215925.304F32076D@mail.kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.8.5, v5.4.61, v4.19.142, v4.14.195, v4.9.234, v4.4.234.

v5.8.5: Build OK!
v5.4.61: Build OK!
v4.19.142: Build OK!
v4.14.195: Build OK!
v4.9.234: Failed to apply! Possible dependencies:
    35aecc02b5b6 ("USB: serial: option: add two-endpoints device-id flag")
    36cae568404a ("USB: serial: option: improve Quectel EP06 detection")

v4.4.234: Failed to apply! Possible dependencies:
    35aecc02b5b6 ("USB: serial: option: add two-endpoints device-id flag")
    36cae568404a ("USB: serial: option: improve Quectel EP06 detection")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
