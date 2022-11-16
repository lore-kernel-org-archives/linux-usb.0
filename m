Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73167C4332F
	for <linux-usb@archiver.kernel.org>; Wed, 16 Nov 2022 09:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiKPJzl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Nov 2022 04:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiKPJzk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 04:55:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF251BF
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 01:55:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 851E361B8D
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 09:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C97C433C1;
        Wed, 16 Nov 2022 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668592538;
        bh=CEzgfZ6hd4w12+k1u6VWqkzOiEc6qgunnSD78UVrzLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V/8DOKieU8iuU4qn3C7iQVVYk55925nNTxSNcs9PZN9zle5l8jjSUrXg/SH5jEkYB
         bTQMJkzzeAQrlZUXhsfF3Fxh/yFu0Oqr059Of3bRQlziL6dUHy4H/4Xmm+yklZrBiZ
         8DG1FbzVtcvQrVW/VrRXJd++Vm3kHBjMiT8C2taObJNdFN5+XNYh3OLPMN1Rjk4zSH
         6TrphNDzFrutaoOgvWRm82CspOyEKTz7eI0GzHELHirWzYyeVcLbO2l4zUFAqLQVvN
         STU9tdQc6P2BsP+C9Ag4PmWxunCslR4YnL0tMotWcA42MHwKDzrh4QajR5CWiSeAPK
         beF/oPXrZ61tw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ovF8O-0008Hm-7j; Wed, 16 Nov 2022 10:55:08 +0100
Date:   Wed, 16 Nov 2022 10:55:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     cesare.marzano@gmail.com, gregkh@linuxfoundation.org,
        larsm17@gmail.com, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH v5 1/3] USB: serial: option: remove old LARA-R6 PID
Message-ID: <Y3SzfG9ljTbeQyWU@hovoldconsulting.com>
References: <Y3SZsdUk1L9v6SUs@hovoldconsulting.com>
 <20221116095042.57026-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116095042.57026-1-davide.tronchin.94@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 16, 2022 at 10:50:42AM +0100, Davide Tronchin wrote:

> > > Thanks for the suggestions. In order to simplify the submission process,
> > > i propose to split the submission for the LARA-L6 patches and the update
> > > for LARA-R6 00B.
> > > Do you think could it be feasible?
> >
> > I don't think that's necessary now that you've provided some more
> > details. Just respin the series and address the review comments given
> > so far (either by rejecting a suggestion and explaining why, or by
> > incorporating it in your next submission).
> >
> > It seems you only need to tweak some of the commit messages in a v6.
> 
> I will submit a v6 version of the patch with the provided suggestions.
> 
> I have just one doubt, in patch v6, should i edit also the previous
> sent changelog by describing changes to each indiviual sub-patch?

No, you can leave them as they are, and just use the "per-patch" commit
log style for v6.

Johan
