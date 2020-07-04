Return-Path: <SRS0=jg6n=AP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F87C433DF
	for <linux-usb@archiver.kernel.org>; Sat,  4 Jul 2020 21:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2935C207CD
	for <linux-usb@archiver.kernel.org>; Sat,  4 Jul 2020 21:46:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flameeyes.com header.i=@flameeyes.com header.b="g0Y+wgZ5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k179sjRb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgGDVqb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 4 Jul 2020 17:46:31 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57055 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726643AbgGDVqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 17:46:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 6A9889CF;
        Sat,  4 Jul 2020 17:46:30 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Sat, 04 Jul 2020 17:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm2; bh=tb
        s93HL0e9buvZl3o3tl/+deZCJ9Jopxx0+FyCHLNMU=; b=g0Y+wgZ527bWg+WAbn
        Qbux479Ueyflh538xVSr1APqDUBxaRVXRF6qUIhrhIWvXabYYT7JUAwu/R0y1Bz8
        4y+XP/QjeL4HpxnDwrbhekHC0NKhjWbBzae9NOh6iSYXmjPU6ODVY8y2/5qkIDBn
        iDPm556qEed2SULi4Tiwf5FyFZH+SDYnD4Zd5Fw18C4LD7Hy7Dq72fZEcwjAyM8K
        LJ7UkGwGEqkO45ooyPmEY17Fmc5aYTTO5eAMW16A0HXopit8i6G2W/rhECTKGhy+
        Tq6QbEpxB15enLOs8sd6PJM+upW2VIV4FOWBHUmYYJSGkLszXR/UZ+jPKozx/6p+
        EqKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=tbs93HL0e9buvZl3o3tl/+deZCJ9Jopxx0+FyCHLN
        MU=; b=k179sjRb6eZ4hVCOQN40Edoo9Of63zTcaBE1VrVyfYUyzH9qUNx7EVz8K
        Rt8mfq/+c/Nh+2CefJHb2x4C/+OHdjlEMqrWtdl9xZyJ+9MtJSUaDl6XI8mKrc7Q
        g/B3e+T/MVSkzX0yNDsFHYNKJ331OhUe0OReJcI/HiOwFmM+mR2vQKJjKDGbDzB0
        oNT6OCVTqDL4YXVRL4pMFuqt3UKXaB7Fi8QSD4RaKYJfr7tOlqZJolWtrDbkSglG
        GuG1LqpT9vqeJuTj0lLLr16/IcCuo2ZimUZiEUAAK941G7rKignEt4eFzws/7MX+
        FRX/1ATTAAB5QPuw5ktNN2ColDi4Q==
X-ME-Sender: <xms:tfgAX2reZ1zjQLqGjZBwQgAjUvuOiCkVRyHAI9708js72GxuoGiopw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdelgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepffhivghg
    ohgpgfhlihhopgfrvghtthgvnhpjuceofhhlrghmvggvhigvshesfhhlrghmvggvhigvsh
    drtghomheqnecuggftrfgrthhtvghrnhepgedvheeufeehgedtudeljeevieeuieekteej
    udfgteeiieegveekueehudehudejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:tfgAX0oLu-fG4Wwd9DMolAFEp-Q3rSSUzLlNGNYYilZveNn20sAneA>
    <xmx:tfgAX7OiYEKAzOBG-mS1diIXp1Ds9OTREnnvbTxOx-ZJordTUlP8Ow>
    <xmx:tfgAX16EOZFBL5eq-2IG_b2VJSo2GtWGb2ySMGVifv3qZs_mVR_fqw>
    <xmx:tvgAXyhDrmxGWNelZYATcvmgpAdW1hgjJkDubALf4P8n69IXePMzDg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 998C7660069; Sat,  4 Jul 2020 17:46:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <74a26b91-489f-4c04-a53e-8930a9df9bd6@www.fastmail.com>
In-Reply-To: <ce1a62d3-4fd7-40a3-919f-9f8bb4130884@www.fastmail.com>
References: <ce1a62d3-4fd7-40a3-919f-9f8bb4130884@www.fastmail.com>
Date:   Sat, 04 Jul 2020 22:46:09 +0100
From:   =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     "Pete Zaitcev" <zaitcev@redhat.com>,
        "Paolo Abeni" <paolo.abeni@gmail.com>,
        "Kris Katterjohn" <katterjohn@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbmon structures headers?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(Updating Paolo's email, that is out of date in both sources.)

On Sat, Jul 4, 2020, at 22:43, Diego Elio Petten=C3=B2 wrote:
> Hi folks,
>=20
> I'm trying to write a quick implementation of usbmon capture in Cython=
,=20
> for an Apache-2.0 licensed project[1].
>=20
> As I followed the documentation[2], I realised that the definition of=20=

> ioctl constants and structures for usbmon are not exposed in headers a=
t=20
> all, only in the sources[3]. This makes it=E2=80=A6 a bit of a problem=
, because=20
> I'm not sure if mimicking the structures in Cython falls into the=20
> syscall exception at that point.
>=20
> Interesting enough, libpcap appears to define the same values, but=20
> apply an MIT license to them[4], so I could copy them from there, but =
I=20
> thought I would at least check first, if this should be exposed in the=
=20
> first place.
>=20
> Please advise!
>=20
> [1]: https://github.com/Flameeyes/usbmon-tools
> [2]: https://www.kernel.org/doc/Documentation/usb/usbmon.txt
> [3]: https://github.com/torvalds/linux/blob/master/drivers/usb/mon/mon=
_bin.c
> [4]: https://github.com/the-tcpdump-group/libpcap/blob/master/pcap-usb=
-linux.c
>=20
> --=20
> Flameeyes
>
