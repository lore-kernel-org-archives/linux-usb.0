Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C966C25B4E
	for <linux-usb@archiver.kernel.org>; Tue, 24 Jan 2023 10:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbjAXKfb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 24 Jan 2023 05:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbjAXKfB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 05:35:01 -0500
X-Greylist: delayed 502 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 Jan 2023 02:34:50 PST
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F5540BF6
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 02:34:50 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id F100228088D6F;
        Tue, 24 Jan 2023 11:26:26 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id E5C76E483; Tue, 24 Jan 2023 11:26:26 +0100 (CET)
Date:   Tue, 24 Jan 2023 11:26:26 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/2] thunderbolt: Add missing kernel-doc comment to
 tb_tunnel_maximum_bandwidth()
Message-ID: <20230124102626.GA32238@wunner.de>
References: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
 <20230124090938.58825-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124090938.58825-2-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 24, 2023 at 11:09:38AM +0200, Mika Westerberg wrote:
> +/**
> + * tb_tunnel_maximum_bandwidth() - Return maximum possible bandwidth
> + * @tunnel: Tunnel to check
> + * @max_up: Maximum upstream bandwidth in Mb/s
> + * @max_down: Maximum upstream bandwidth in Mb/s
                         ^^^^^^^^
			 downstream?

I'm sure you're just testing whether anyone is reading your patches ;)
