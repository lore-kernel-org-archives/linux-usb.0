Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101C1C19F2D
	for <linux-usb@archiver.kernel.org>; Tue,  9 Aug 2022 12:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiHIMJS convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Aug 2022 08:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbiHIMJR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 08:09:17 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DAC24954
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 05:09:16 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 60B09C0004;
        Tue,  9 Aug 2022 12:09:12 +0000 (UTC)
Message-ID: <0d09c2106c86cb8fe7f715f3acd17ea84c7f224e.camel@hadess.net>
Subject: Re: [RFC v2] USB: core: add a way to revoke access to open USB
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Tue, 09 Aug 2022 14:09:12 +0200
In-Reply-To: <f193c5efbcca6d6577c93ec62559f81db35a11db.camel@hadess.net>
References: <20220804160306.134014-1-hadess@hadess.net>
         <YuwaFbxckLfnqhyv@rowland.harvard.edu>
         <b050e5b9f3ff1ff6da77483557e014f3e5ed4ece.camel@hadess.net>
         <Yu0pqAYRfS46pte3@rowland.harvard.edu>
         <f193c5efbcca6d6577c93ec62559f81db35a11db.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2022-08-09 at 11:10 +0200, Bastien Nocera wrote:
> The process goes something like:
> - change permissions on the device node so user A can't access it
> - revoke access so that the device is effectively "muted"
> - change permissions on the device node so user B can access it
> 
> It's already what exists for input devices.

Correction, it does:
- change ACL on device from user A to user B:
https://github.com/systemd/systemd/blob/main/src/shared/devnode-acl.c#L139
- revoke access for user A:
https://github.com/systemd/systemd/blob/main/src/login/logind-session-device.c#L116

