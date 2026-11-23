Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795462246;
	b=J7oT10oh/3EfSLy2HN+SCkpfhaeIPbUYEoq0gCrfpUkCb+mnK84l3yVeymoMWhqhyaA3
	 5r3r8rhR/Hco3GDO/w0T+OI09lHUyoLkr28XcBxSjSwDVV0BCA3n+rW7XOSKksmkwnsWU
	 g3ag1MF5M0Wp313m0z859x2EZir5Kggp2LaKdTi3kvGFRSZVgR44EVza0s723HKExiU59
	 1QyWHoCcfE4ozYbdkx49++bwB3asvw6kzVsKKO73qrd1benqzHV/h20kEyM4JmIkDebWz
	 lT+Uc+JV4JG8rsXToHevoeRhN8aztT32GZdrIAvdPUFRMiAeuIKNJXnvcIu80v4o/aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J9HL1GczKVUsA0QA3fywXb4GBtKWVrrqUMxuNy6hTvo=;
	b=yEqQCFn5y1TiD8h64RWcN/U6aFSQ4ycy0dUmetZ47QFQQABHQ0WoboayXJY7g01aTWCb
	 pR1IU70eXxwXyyUnbJr2fV4kKslBWQM53VMVoPcX8sUq570gQUVqL+DxPndad5J6DoSki
	 lNtzqUorfhMObwUUvIkzxYkEZb9otdVLDC7KjsxdBQiFLiFMGm2wyWmhurf+xZh3eLnuQ
	 lL2Pib2PQHvMeV+w8nqhAEK+PkjT1u1KyBuIHghJuJRmJBgheMwbP9LZ7XodhfYfe6wiY
	 B50nU5lFTU/OT87BN/muzZvam9xJf4OgZLxEpWuKV64VB0NR/51ita+K3xb8Qk8eGww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LX7QH62p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50B8606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LX7QH62p
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec2cc397aso1992431b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:30:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795462245; cv=none;
        d=google.com; s=arc-20260327;
        b=R2pFij4cRORaMmUYTDH6ln1G9tmGEX6VewhNaICyXHYi0xgVYUkX/rIqzGMYY1TnTX
         EploIB/3hZdylEtMVIDFTxdJ5+lxtWdNSHGhrt1Ht0+B6dhGqzY0/yz6Ur1xQyREcuAC
         NDwEorzdAg61Bh7RogAHOe1R6c3EMZp+GjDG6swd1q9J9hUqd/fApqk5iSzL4U9iFFz/
         CNWluwT5V+4Cto/F7hUZNIaA22NDQPUK0Olv4NT3gNIFKVap0Ei8/h0Udpi6YT6U0d7K
         HZyPWIBnDqxkBltjdV3F/63hcm14Ax6C8kfelq350tYnBvaZPu8ouEMaoKRXk/zsS5dm
         trfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9HL1GczKVUsA0QA3fywXb4GBtKWVrrqUMxuNy6hTvo=;
        fh=W8GAWayf94oVleIiIs9dPs1Wq6N9MY6JffgzPqf22Nc=;
        b=dMYd1ng6feOSHuMn1w2+mnweu0uJLiG/P+Z9oSjMs7oVlXek1+ifYeDuiztD0YZfPX
         taqghb8rUIClXz5QGQLySnboMvAjsBwFrfD0rqIoIvEjQsPueYzxDC7JDbW5Zt42XnyU
         VLgHJf76aU9u729/X+wVrL/v0ezunefPwPGy7Q3NBPl8WyRyqULlypnplFYVIdAp3Wwg
         4VtaBarC0bqD1N43Ls0WCi8Het26WTRMil/0q6nnZI6luCVr/tegshrLBos54TNFWD7r
         jVY/Bu7O9md9w3DQW1a2BwvHcYbIlJfbctYymva4dJXyQLVTArqzcR9PiGRDurPcd5AI
         yfOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795462245; x=1796067045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9HL1GczKVUsA0QA3fywXb4GBtKWVrrqUMxuNy6hTvo=;
        b=LX7QH62prvmRprt/KaCq9l7RUGR6MW5QPJJRl61OtL9JZQFCzVemgNCE5/g0zL8QA3
         f999an+hMoSgV3yCdYEDsjWBG1efjI0zhVgaula8605zPmxBBWyw8R8YFcHa2lDZAMR1
         DsJQLQ6Hg2drGs36ASq+4NBa19k0wLLrJ5fQbP7yJ57dr8XFUnRuzHsfJyQJKN2S+zbV
         rtB+rwA3ozKbzon3ArK4+dZTP0f6rYHfVtPpZlD5ui6pd/jfHfgrBp1Jcq1oGjy1YJPJ
         po1ZPCuJQkuZCjZe638cDwtA98thIZVY/1i/0y2eoWEMJflJG41uxzMo4bGhyZ+9SD1l
         sIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462245; x=1796067045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9HL1GczKVUsA0QA3fywXb4GBtKWVrrqUMxuNy6hTvo=;
        b=oZmOGLNjoEGwlGAYPx9rdMJdgX+otUTXfV6efZAC0Lt9obg/t7mfI3zwLR6T2NHkl1
         cm8ESDSRWaEOeKT+lorKa38u5lqxZNOR178yN8dUKSZLoJIi5j/gmRE7Vtd3IGqOIqH1
         330lKHpJHHoj6JfyaafTQzFepYNJfaOTqFCyniPuYm20Ss5ZKPnQojhguDU3DKECgkoP
         TV6OBZ5462ts+rl17EzLnWrTkJ0cxFnJlM9lqqmCvYS02bHj+9I2WYidHhd6DpTCrUGF
         M9Uc5ryKTe2xUJcz9VJrlgSWiTrCy5h+pO00lvR8fuTbh3WOHp7sizloOGZVWkgkK4tG
         ADww==
X-Forwarded-Encrypted: i=1; AL+hErECXQdfcHZK5wcEW2Do3Hz0TqNpGQVeQJkqfrltK7PDcZ90XTPSWfqdDZAy+AIUjXrY/o4N29RwqPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z92fhGpl8QDsm7c1BahFF6z7oxorL+C/ZG+I6BGqh23poJ8tS3g
	hOhBhDDkrxfkHjO16VYxxqgyQbkZK6+0FlkIVO00CKlyVvsVJ+NoI3qg2jLZrF28FOXHXnE2Nox
	rGL/Xq3SJGAxR2zaMxjGRptxrqN4z5EanDwTCtrvd
X-Gm-Gg: AZFdTZe0WyTBfG5F9pIO7Zzq/dsS3W7QtbbvVRA+w064dRH6NKxQKrHTPdtURj35iLa
	gCeZhFAZJ1ufUkZy2Dy+5uIMLoLYqLqADsKWiL+lyDGA/Jr2tTx55ZrEWL322wFrYxOVnCaqmq+
	LLvLMCiYVp61qUcIQPrs3WlBTG8OnZ4SoJjRadi9mltAUUKV5sgI56PVrHsH/S737cN8dFLyMp5
	mAQbds5TtpUfxdRcfmnIr6ous/jO0ljbKa3d5AHrjCdGngodFc1aXkSxoDZEDxvLhfVF4hbPP/k
	DJCcg5cXrlQiTMtUAQnMclxQCTAJNuREW/sGW/p5apnsUckoIIOj3+KZpCTY7qR4kC7ae9Xb+or
	x56JeY4knfWeS1J7HSZlVfl8FsJmA++t2q/VlB5qXyLAoQUrFJiOv3NjYaMhZJiWAUd7SWLc=
X-Received: by 2002:a05:6808:4fe1:b0:575:39f9:df7c with SMTP id
 5614622812f47-57a06504990mr14041604b6e.2.1795462244324; Mon, 23 Nov 2026
 11:30:44 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net> <20261118-tcpm-soft-reset-sop-v2-2-b6decdc95e66@flipper.net>
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-2-b6decdc95e66@flipper.net>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 23 Nov 2026 11:30:33 -0800
X-Gm-Features: Aa3M54pUjC99HdONKYWzXGaM6Hr8ZpKVX5kohDQnv5pnvvHDaIrSDaIDtVLGutk
Message-ID: <CALzBnUGpwPWo==RuFOQwT11CU0XKvCHhU0ur2e=DgTfCqOY1sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] usb: typec: tcpm: Stop replaying
 Source_Capabilities after cable discovery
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The patch looks good to me, setting port->upcoming_state =3D INVALID_STATE
out of SRC_VDM_IDENTITY_REQUEST also addresses a preexisting gap
that can be added on, or I can address it in a later patch on top of yours:

Disconnection during SRC_VDM_IDENTITY_REQUEST leaks
port->upcoming_state =3D SRC_SEND_CAPABILITIES into the next connection.
This could mean a DRP that reaches SNK_READY following the leak will
enter SRC_SEND_CAPABILITIES.

This would be fixed by clearing next_ams and upcoming_state in reset_port:

port->upcoming_state =3D INVALID_STATE
port->next_ams =3D NONE_AMS

Otherwise,

On Tue, Nov 17, 2026 at 11:27=E2=80=AFPM Alexey Charkov <alchark@flipper.ne=
t> wrote:
>
> When its first Source_Capabilities goes unacknowledged, a source that is
> the VCONN source asks the cable plug for its identity in
> SRC_VDM_IDENTITY_REQUEST. Entering that state sets upcoming_state to
> SRC_SEND_CAPABILITIES, for a message from the sink that interrupts it
> through SRC_READY. The ACK and send error paths go to
> SRC_SEND_CAPABILITIES directly and leave upcoming_state set, so the
> first SRC_READY after the contract sends Source_Capabilities again. The
> second negotiation can cut into the sink's own Discover Identity, and
> once ended in a Hard Reset between two FUSB302B ports.
>
> Clear upcoming_state when SRC_SEND_CAPABILITIES follows
> SRC_VDM_IDENTITY_REQUEST directly.
>
> Fixes: af8b627046bc ("usb: typec: tcpm: add state machine support for SRC=
_VDM_IDENTITY_REQUEST")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Reviewed-by: RD Babiera <rdbabiera@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Best,
RD
