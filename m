Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71936C433F5
	for <linux-usb@archiver.kernel.org>; Wed, 13 Apr 2022 09:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbiDMJ4Z (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 13 Apr 2022 05:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234777AbiDMJ4S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 05:56:18 -0400
Received: from fx303.security-mail.net (mxout.security-mail.net [85.31.212.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3876E5575E
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 02:53:54 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx303.security-mail.net (Postfix) with ESMTP id 00740323622
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 11:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1649843633;
        bh=HslCilQCgNPqoK7RN+fTQzHPEpFL1HfA4/WsCZMDqwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=B2negEwVhkEFNTvRvd1/cGtZmSQbOOG70Sut/KsgxwPWmT+jlasSQoZns+IzCtcY6
         azPKmaMrK6G9K60EVAU1AIFfJxpV0h3c0zKk3a4p+A3pwS/f5Blxa4dFAMdweouoZR
         SUiIf3qwHPrC/K8NgghLKxxPGmy0KA5ImCSD7BX4=
Received: from fx303 (localhost [127.0.0.1]) by fx303.security-mail.net
 (Postfix) with ESMTP id 99549323712; Wed, 13 Apr 2022 11:53:51 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id E4853323609; Wed, 13 Apr
 2022 11:53:50 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id C871427E0470; Wed, 13 Apr 2022
 11:53:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id AEE3127E045F; Wed, 13 Apr 2022 11:53:50 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 uR_qJhiZIQBW; Wed, 13 Apr 2022 11:53:50 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 9724E27E045B; Wed, 13 Apr 2022
 11:53:50 +0200 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <d178.62569dae.e1fd9.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AEE3127E045F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1649843630;
 bh=Lm54Dkl0r0JniR6xVhnA0jJcCsE25KTaly6VP1Q1eps=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=LXolY0Sy0/YQGCmecb2WOx946/21QCH9KFJNCXRTXqfZf3iAKJZf/be424/zx665E
 DrhXPNTtuu/Xoqn6HUAX+0H5RdrQE7iIM2UTN+BEs9FpY80L2jkZD0xuwoE9tlbIcP
 ZOIuGaSfrAc5jOKQkFN+E8TsrjRDaOLkUOazKSfA=
Date:   Wed, 13 Apr 2022 11:53:49 +0200
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v3 2/3] phy: core: Update documentation syntax
Message-ID: <20220413095349.GA25550@tellis.lin.mbt.kalray.eu>
References: <20220407102108.24211-1-jmaselbas@kalray.eu>
 <20220407102108.24211-3-jmaselbas@kalray.eu> <YlZnb2dJjaroDfyu@matsya>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlZnb2dJjaroDfyu@matsya>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 11:32:23AM +0530, Vinod Koul wrote:
> On 07-04-22, 12:21, Jules Maselbas wrote:
> > Update the syntax used by the documentation of phy operation functions.
> > This is to unify the syntax with the newly added documentation.
> 
> Is there any reason for using this sytax, is it documented somewhere..?
> How does this syntax help?

I don't have any particular reason for this syntax, this syntax have been
suggested by Randy Dunlap.

> 
> > 
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> > ---
> > v2: new patch
> > v3: no change
> > 
> >  drivers/phy/phy-core.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index d1817a0f2d09..d11b517e283a 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -467,7 +467,7 @@ EXPORT_SYMBOL_GPL(phy_reset);
> >   * runtime, which are otherwise lost after host controller reset and cannot
> >   * be applied in phy_init() or phy_power_on().
> >   *
> > - * Returns: 0 if successful, an negative error code otherwise
> > + * Return: %0 if successful, a negative error code otherwise
> >   */
> >  int phy_calibrate(struct phy *phy)
> >  {
> > @@ -493,7 +493,7 @@ EXPORT_SYMBOL_GPL(phy_calibrate);
> >   * on the phy. The configuration will be applied on the current phy
> >   * mode, that can be changed using phy_set_mode().
> >   *
> > - * Returns: 0 if successful, an negative error code otherwise
> > + * Return: %0 if successful, a negative error code otherwise
> >   */
> >  int phy_configure(struct phy *phy, union phy_configure_opts *opts)
> >  {
> > @@ -527,7 +527,7 @@ EXPORT_SYMBOL_GPL(phy_configure);
> >   * PHY, so calling it as many times as deemed fit will have no side
> >   * effect.
> >   *
> > - * Returns: 0 if successful, an negative error code otherwise
> > + * Return: %0 if successful, a negative error code otherwise
> >   */
> >  int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
> >  		 union phy_configure_opts *opts)
> > -- 
> > 2.17.1
> > 
> > 
> > -- 
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
> 
> -- 
> ~Vinod




