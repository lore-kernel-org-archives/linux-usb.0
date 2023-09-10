Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29383EE7FF4
	for <linux-usb@archiver.kernel.org>; Sun, 10 Sep 2023 06:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346187AbjIJGNh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 10 Sep 2023 02:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjIJGNg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Sep 2023 02:13:36 -0400
X-Greylist: delayed 332 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Sep 2023 23:13:28 PDT
Received: from freecalypso.org (freecalypso.org [195.154.163.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63834CC0
        for <linux-usb@vger.kernel.org>; Sat,  9 Sep 2023 23:13:28 -0700 (PDT)
Received: by freecalypso.org (Postfix, from userid 1001)
        id 04EE03740166; Sun, 10 Sep 2023 06:07:23 +0000 (UTC)
Date:   Sat, 09 Sep 2023 22:07:04 -0800
From:   Mychaela Falconia <falcon@freecalypso.org>
To:     sgowdy+usbweb@gmail.com
Subject: USB ID repository https://usb-ids.gowdy.us/ is down
Cc:     linux-usb@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20230910060724.04EE03740166@freecalypso.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am the "functional owner" (really lessee) of a few USB PIDs under
FTDI's VID 0x0403 (PIDs allocated by FTDI to my company, for use in
my designs based on FTDI chips) and I am trying to add them to Linux
usb.ids, so they will show up correctly in lsusb.  I found this web
page which looks like the official repository site:

http://www.linux-usb.org/usb-ids.html

However, when I try to open "Browse" > "USB devices" or "submission
guidelines" links, they all point to somewhere under
https://usb-ids.gowdy.us/ , and that site appears to be down - I get
a long hang followed by a timeout error.

Is there a working way to make submissions of new VID:PID codes to
the usb.ids file?

TIA,
Mychaela
