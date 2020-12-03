Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BB2C4167B
	for <linux-usb@archiver.kernel.org>; Thu,  3 Dec 2020 14:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 985AB20784
	for <linux-usb@archiver.kernel.org>; Thu,  3 Dec 2020 14:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgLCOrh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 3 Dec 2020 09:47:37 -0500
Received: from avasout07.plus.net ([84.93.230.235]:45355 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgLCOrg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 09:47:36 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id kpsdkWRrzoEd7kpsfkrG9Q; Thu, 03 Dec 2020 14:46:50 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Kp/WJVeN c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=e8f0TG_ZU_75g7eUk7wA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                                           <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                                        <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>                                   <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>                                     <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>                                   <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>                                 <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>                             <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>                   <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>                       <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>                 <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>               <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>         <612be9a9cd6ffdb9492781e174859c7b4e69
 4a86.camel@suse.com>       <000301d6c919$af7a94e0$0e6fbea0$@perdrix
        .co.uk> <f5b4e5fccec5521059c78d4f4345c339dce707d5.camel@suse.com>
In-Reply-To: <f5b4e5fccec5521059c78d4f4345c339dce707d5.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Thu, 3 Dec 2020 14:46:47 -0000
Message-ID: <000f01d6c983$22199910$664ccb30$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwML8I43Acv3vzcCAy63SAJfP5HDAb+vYkUBebTJRAHZtB/YAWHG95SqZgsT0A==
Content-Language: en-gb
X-CMAE-Envelope: MS4wfCZP1Cjla9iflNMNRzKlNZQXibWBcKke5R3YyKo3igJ6vbiIfiOYZQWPh34OlAZY+1HrVJuLIoybJlwfLQhOLNQXjvRDcQv+As4moA2IrkkFU5wCK3xs
 jQWHqKh3pDtUEiYD8jHz8UUPk1CfSojCj4PzzmPsIW57PkPAhstShEgCLA77rVsJgQfr0o6YF7s3Rw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> upon further reading, could you repeat the test with an additional SINGLE_LUN quirk?

Happy to do that if you can confirm what the blacklist-uas.conf should look like to achieve that?

Should it read: options usb-storage quirks=059f:105f:ks

David
-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 03 December 2020 14:07
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Donnerstag, den 03.12.2020, 02:11 +0000 schrieb David C. Partridge:
> Now with uas.ko	and usb-storage.ko 

Hi,

upon further reading, could you repeat the test with an additional
SINGLE_LUN quirk?

	Regards
		Oliver


