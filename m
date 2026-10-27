Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113963;
	b=XILEGnAq2BKfmVdDihVy817JQKooaMR1tBNLCltibgitKYBX87arTAoDm0E+NrlVTrJl
	 tBID7Es+jebnNW9LHY7qkXwt22OBlI66mxQMCZr8EYXD0qtBm05hjQjaQiCXiqUP+S6or
	 BaeIc9YtcmiQ7AYumK86LlRkA6yjM3EW1tiosMuysUC48YzQB275I3GvCxyhmBDCbBQtV
	 scapVr8zf4IkC94fQ7JRYlXM+QyY38v3RGyONivPhSu3dnawD+WBNLz38VYoPje4kNKhZ
	 NyWaWaHXUQ2OrX3gVnnSdc1qA+7qpiyzcXewPzH4tPeDD7bwlPKUUCB+yfcfTMTm9zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113963;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xvsvUdxcvd3KUh8NBWHUqQXklCfb+Cn5toW9r0WdeLM=;
	b=m5jcmXt95HbVTYEtIhHy98mIDoMuPbGOF/3oRxWxeYpLhtP/D2q4N+SdGeAb9E+f83v8
	 H1+v/dZ4DhYY1XdkFWhgE3sLTO2XMIdbMzCQhSi3fJMudsz5lcY1r5xsFiqqqjeKGAch6
	 deVfpeBqDlrmLGOQGut8QATlmnv8go5wbOLSRCCqP3CaKDxcF+ajdzDlV487XLTZq+16l
	 w/Ltr/jMDjsLVUB86WAGHPiuBlKo/lqYpxAGcjysdEog4pfLkvn7gK7lbbgecZAoEZV2O
	 7678KwboRe5CsugNWcipqdisyC/88OYwsntcFaSnJcJ7EReC5dNfpmscvnvTCtmlVtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0xXJlC8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BA606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0xXJlC8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FB51F01825;
	Tue, 27 Oct 2026 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113962;
	bh=xvsvUdxcvd3KUh8NBWHUqQXklCfb+Cn5toW9r0WdeLM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=P0xXJlC8Ey2DCOv5BjNaP1dg5ynJIwzjd3GxR0S8dYRkTlJZkd0HGOyUDdlOGNKTj
	 l9flkp+EL85EzDXRuvlbSWuWoeHQIBAF14ICInOeab0Nix8FgvRicjJAGadXo+zHNB
	 W5cctfNVOXjcxRcjCRApWNoPm4QrmNTGZp7rXhMOsqlSY6o5xx53crwP4Ds7Hs4k46
	 2FAdh3JuaTkYBRqlgY3ksYvMkr69M1jvXuzTarEbiOKNECNmuDw0dt72FTlY6HP+C/
	 tT+YJASKEdbpSClBUYQCzctd53fW2NLjp977/OIO32LCsndMclEmQsLwP0tqqF9lz8
	 7O+jSufFToJYg==
Message-ID: <sashiko-outbox-186810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/19] usb: typec: tcpci: don't act on unread alerts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-12-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-12-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:12:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> tcpci_irq() ignores the result of nearly all its register reads.
>=20
> If the first read of TCPC_ALERT fails, "status" is an unwritten variable,
> and its bits decide which events are reported to the port manager: among
> them a hard reset, which drops VBUS. If the read at the end of the functi=
on
> fails, "status" keeps the alerts which have just been handled: they are
> handled again, for as long as the read fails.
>=20
> In the receive branch the byte count, the header and the payload are not
> checked: a count made of stack content trips the WARN_ON(), and a message
> made of stack content is handed to tcpm_pd_receive(). A failed read of the
> frame type returns a negative errno as irqreturn_t, with RX_STATUS still
> set.
> [ ... ]
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D12

