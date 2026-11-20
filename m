Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175261;
	b=idwU490vn/jaWitnylNuMEHxhh2mE8NTcLclZpvgVphzlm/kAwNXofYj1KryNd5ORCyS
	 +dkG0oX7oOP+K1eV9/Bw/clXs+wnXPCitw9ktFVafgzOzEzkOijsp8LlRnZHIi9Ay4kTc
	 EL7zmQTtFrpV7OuYxJXWmhXXNedIUFw39dXYqINpoLOGktXXojNWKrFYBYt33Q4ZoUTyM
	 14uCXgZtHAwRSzYgL8ABh4jffUyZvGYUahLgNp/1FvGLWYl7fTThLlRbf8cv0vOqSqrJg
	 UvqhXpUs5SuuNR69UHWcWKjN/AgTESVbzWwmM52jkZ8JWOXLMKr8FbKDYzH+Tri9y5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175261;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BfUrtqo6NKO8a/JiKqJT6e2mAb4NsSRPO4Fy8mksc04=;
	b=3jHdik23QuKATanuW2ThtGk8UlM0EVyqMmJ4jKRFKntyn/CXzCKmrnMsANWCWylK0B9+
	 AK7P4Q3YhoJeLtn9M05oDEmHYU0jeLFtMxXHAEDFlga0VxutHRKisouvwxdXAqqGD9jeV
	 vO0Kt6FoWOiDV4rLdf1OIK4lTJegmjEfkSwENXiHHdo1/lu8rEBEfihUN8w6aMFYnik0J
	 Ach7zQxpG6GU7Gr9TInDv/PW6ww52Xv216XfA28czNDzBA/fHp7nmgTdsGNxIgixssGf1
	 y9LB4ATqVxKOA/lZzXzR1kQ62DD8FpeV25dZp66qeyDCi0Y4X765oSuDAGZ0XjY4BDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKkvDDBB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0719606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKkvDDBB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9ED1F000C4;
	Fri, 20 Nov 2026 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175260;
	bh=BfUrtqo6NKO8a/JiKqJT6e2mAb4NsSRPO4Fy8mksc04=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WKkvDDBBrRbKBcfO8CqulouVWRBBsV8OdmzJbv4HIi7i1ZP5Oe4wNX5qFXbiKWBnK
	 5aUPKPPJsFkb+qSaLFb3hRVnKNMKQxEGRIs+pPQBoDGf8Z0VpIrt/nIuN6seAs0A9v
	 KJO3qSyrcBxvJZxS/nDOrp6p4Z9I58s0a4X/7WoV+sCwGmvbRTVnstY/F0hRRAlp0b
	 4E39+Zj8s491808HFjhI00cZliO7oy/9ZccLDxn/hYJC9zaLjxThRUHIzeJymxP93h
	 x4c49xUnM9Xvnl+VQ7AyG64k/7bNPEQ5GkhkQ87RM3uz5HvboYXhI0CKJO/kWx1OvC
	 NysSMeYycDIEw==
Message-ID: <sashiko-outbox-225097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: do not dequeue UAS stream requests
 in BOT mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261120113956.3071640-1-yhlee@isslab.korea.ac.kr>
References: <20261120113956.3071640-1-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:47:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usbg_aborted_task() starts by reading stream->req_out->status.  The
> stream requests are allocated by uasp_alloc_stream_res() for the UAS
> alternate setting only, so in BOT mode they are NULL.
>=20
> The target core calls .aborted_task() from target_handle_abort() for an
> aborted command whose CMD_T_TAS is clear.  A BOT command gets there when
> a LUN RESET arrives on another fabric that exports the same backstore
> and the backstore has emulate_tas set to 0: core_tmr_drain_state_list()
> aborts every command on the device, no TASK ABORTED status is owed, and
> the core calls .aborted_task(), where the read faults.  With the default
> emulate_tas of 1 the core sends TASK ABORTED status instead.
>=20
> Return early unless the function is in UAS mode.  A BOT transfer uses
> fu->bot_req_in and fu->bot_req_out, not the stream requests.
>=20
> [ ... ]
>   note: kworker/1:1[30] exited with irqs disabled
>=20
> Fixes: 76003eb6d09278 ("usb: gadget: f_tcm: Handle abort command")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120113956.3071=
640-1-yhlee@isslab.korea.ac.kr?part=3D1

