Return-Path: <SRS0=d+F7=XE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934D0C4740A
	for <linux-usb@archiver.kernel.org>; Mon,  9 Sep 2019 12:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7519A218DE
	for <linux-usb@archiver.kernel.org>; Mon,  9 Sep 2019 12:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbfIIMpd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Sep 2019 08:45:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:58438 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728733AbfIIMpc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Sep 2019 08:45:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 515C2ACC1;
        Mon,  9 Sep 2019 12:45:31 +0000 (UTC)
Message-ID: <1568033125.365.17.camel@suse.com>
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     Julian Sikorski <belegdol@gmail.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 09 Sep 2019 14:45:25 +0200
In-Reply-To: <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
         <1566567572.8347.54.camel@suse.com>
         <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
         <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
         <1566595393.8347.56.camel@suse.com>
         <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
         <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
         <1567424535.2469.11.camel@suse.com>
         <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
         <20190904155831.GE4337@nathanst.com>
         <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 04.09.2019, 19:10 +0200 schrieb Julian Sikorski:
> 
> 
> Moreover, does this matter that the two Read Capacity errors only appear 
> after the device is disconnected?

Hi,

yes it does. However, it didn't in the first log I looked at.
Could you check whether the command the failure happens on
is constant? That is, test a few times and look for differences.

	Regards
		Oliver

