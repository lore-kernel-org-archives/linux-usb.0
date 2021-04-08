Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0EAC43461
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 13:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 942D661177
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 13:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhDHNQc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Apr 2021 09:16:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231527AbhDHNQ2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 09:16:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B296C61154;
        Thu,  8 Apr 2021 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617887776;
        bh=omPlu73KopU66ypRAh20u3JyYJa9RKvVBgANzppAeZQ=;
        h=From:To:Cc:Subject:Date:From;
        b=fkLLl+czLc9LUX+d2br1Tl6Z67vByBL3CcPBBSmr2iip0IOqPTgyPA1iZuRWnEv4q
         ev8SGQOp+r8fs9ZnAgHoxw21ynUiDj+lYpAjimM3OmXTrNLti+e38oJiqpXWy19RgZ
         QRIrYorMvqF4BnRmD8Xnhv2uwkARWNRdOcIi3gMaPXI+AzAmdrNHD0YB9oDfpVK307
         CqcHEi2s1LhEIQmrWljh1iE72V24WYilQ1sGkf29KuqkX/ai3QHE0of18zLdEZWU7b
         Iu8Cl001yjoSRqKmWiOPAaSE13vOH8OUmx/0BWTtbIII3/0fKcV3kX/En4YaSnps5I
         QRwoEzZz1HG7Q==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lUUW3-0007Hg-LV; Thu, 08 Apr 2021 15:16:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Anthony Mallet <anthony.mallet@laas.fr>
Subject: [PATCH v2 0/3] TIOCSSERIAL fixes
Date:   Thu,  8 Apr 2021 15:15:59 +0200
Message-Id: <20210408131602.27956-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes up a few issues with cdc-acm TIOCSSERIAL
implementation.

Johan

Changes in v2
 - amend commit message to clarify that the 12 cs close_delay bug had
   already been fixed by an earlier patch (1/3)

 - amend commit message to clarify that the base clock rate isn't known
   for CDC and that the current line speed can still be retrieved
   through the standard termios interfaces (3/3)

Johan Hovold (3):
  Revert "USB: cdc-acm: fix rounding error in TIOCSSERIAL"
  USB: cdc-acm: fix unprivileged TIOCCSERIAL
  USB: cdc-acm: fix TIOCGSERIAL implementation

 drivers/usb/class/cdc-acm.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

-- 
2.26.3

