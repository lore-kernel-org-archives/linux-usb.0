Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_50,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC82C63777
	for <linux-usb@archiver.kernel.org>; Tue, 17 Nov 2020 09:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A28E32417E
	for <linux-usb@archiver.kernel.org>; Tue, 17 Nov 2020 09:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=madh.eu header.i=@madh.eu header.b="BQOVK4vZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgKQJOD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 17 Nov 2020 04:14:03 -0500
Received: from pao.o2scoral.fr ([109.234.167.119]:44072 "EHLO pao.o2scoral.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgKQJOD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Nov 2020 04:14:03 -0500
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Nov 2020 04:14:02 EST
X-MailPropre-MailScanner-From: ddhx@madh.eu
X-MailPropre-MailScanner-SpamScore: s
X-MailPropre-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
        score=1.658, required 5, autolearn=disabled, BAYES_05 1.50,
        HELO_MISC_IP 0.17, RDNS_DYNAMIC 0.98, SPF_HELO_NONE 0.00,
        SPF_PASS -1.00, TVD_RCVD_IP 0.00)
X-MailPropre-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-MailPropre-MailScanner-ID: 499631005B9.A6A15
X-MailPropre-MailScanner-Information: Please contact the ISP for more information
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=madh.eu;
        s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=RTu6lxPlmRl+CD+vg0S2622UgRMHHI/fKl01GZ9NPDc=; b=BQOVK4vZKF8Xh7lWpEKb5e7aRs
        No68FjINjNVVjSeJ2vLFTOuNU4EQiK0O0/jVE++dVxcKmNXm+5c780bLYPb15JZiqOI0DJFi//x+6
        cVGX7p7C/vbc4S6hU8gQsDd5sjpAE7uWfoDMykKij1WOD4TRy6RuOA9bvmPCUU+hASGBJMETSbDyQ
        OgnlBFNdpYfVlc4imrl+KMsea1K7xMr68PG4g5sG6ikKB4FWo6pjlMI1lTjZ91PDSx6vY9dtNzOeu
        on9RlV+blY4Y1eYYjIC92USbYL6Gyc3qwLz9dFYfl9O1VGBpBYe8LkBUvdpD1ZRpylRbg14Jn7uUQ
        oWygNp6Q==;
To:     linux-usb@vger.kernel.org
From:   ddhx <ddhx@madh.eu>
Subject: Garmin 72h
Message-ID: <dba77dcc-5ff2-912f-2398-04f46be2966f@madh.eu>
Date:   Tue, 17 Nov 2020 10:08:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - parmesan.o2switch.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - madh.eu
X-Get-Message-Sender-Via: parmesan.o2switch.net: authenticated_id: ddhx@madh.eu
X-Authenticated-Sender: parmesan.o2switch.net: ddhx@madh.eu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Is it possible to add the Garmin 72h GPS?

Thanks,

Donald Hervieux

