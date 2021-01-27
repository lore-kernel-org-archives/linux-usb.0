Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70054C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 27 Jan 2021 05:54:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3947D2070A
	for <linux-usb@archiver.kernel.org>; Wed, 27 Jan 2021 05:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhA0Fxz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 Jan 2021 00:53:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:59790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235448AbhA0DSq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 22:18:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82E95206B2;
        Wed, 27 Jan 2021 02:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611712952;
        bh=qjKPSvq2/sXduQY1iPiLfKOsENOPlhHdSK6mnPq1Uvs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bWQPt9KLXBZV0JQbqgPOfj6zbIiNKC1DZEyML0iXrWUHvWCszrQJV6h+cccJmsu+R
         +MLy3Iun/xK4cQPCl6MCZETZg8TwFGRPGG3tW7iRnGemnNHg+ANiJrG/oXw/b3trjI
         erGI1n8bjlFkiwXjvNYORbBr0cUBvhI+/hssZKPOwQcj6utU/fHcWkF9HNmjXaGHN8
         5X7svdUVDD0zCRmDPZ6cupaGLXMM8Abg/uCekxsBmvBmAG1ce0DUOjUvjhU8xc6EAF
         nadEx8091CWAsiQbTpz2moRU8Wm8znUBgMWZkfDt+i2evFXJnXZHRNa+U4lq3CBAT7
         B9mteYRxBRYjQ==
Date:   Tue, 26 Jan 2021 18:02:31 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Cc:     Daniele Palmas <dnlplm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: [PATCH net-next 1/2] net: usb: qmi_wwan: add qmap id sysfs file
 for qmimux interfaces
Message-ID: <20210126180231.75e19557@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <87wnw1f0yj.fsf@miraculix.mork.no>
References: <20210125152235.2942-1-dnlplm@gmail.com>
        <20210125152235.2942-2-dnlplm@gmail.com>
        <87wnw1f0yj.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 25 Jan 2021 17:14:28 +0100 Bj=C3=B8rn Mork wrote:
> Daniele Palmas <dnlplm@gmail.com> writes:
>=20
> > Add qmimux interface sysfs file qmap/mux_id to show qmap id set
> > during the interface creation, in order to provide a method for
> > userspace to associate QMI control channels to network interfaces.
> >
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com> =20
>=20
> Acked-by: Bj=C3=B8rn Mork <bjorn@mork.no>

We got two patches adding new sysfs files for QMI in close succession -
is there a sense of how much this interface will grow over time? It's
no secret that we prefer netlink in networking land.
