Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472594;
	b=SXzoMRmc1pRA3jbZ5szOlUmESuwX+jVuxax597c9Fpk28kveagmPSaRKjUEUN3p4CsXo
	 NiDrpnI6dy4TZTWI1iflFC5WK2ek3ilZL+vA9KmA7LGNUp3k6R6fKXS+fc7f176/OsG5j
	 n+nSFI61P82v39bywfn1t7DGd74kc+iMVPbSRh4X2cY5xY15wm1a+Y8lBKtJoU77IRtgt
	 xuCQdQ8rJUFspVQg1mJszPgzTXJVp6D8ow0SY+zw6dFg4JzCQn0JfIDJdZNeT31cgRqqG
	 rOQoraOwu8Hr8oJx+pIo22PbTJOcrV8jgMHWInDJs6heyE3yFe2iRGDhuUBlmzkY9/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UhP6SD+jVOcQXLACldAIeRQph2vLXu3eFqLjHqhceck=;
	b=LehGmpSMvDh/v7JxVt2BC/lxU1vIi57Bm7XmZh81hlHBtZPx6UpBkD+7+9bqw27Ut19i
	 Qdfz9ZfTdqgtDnBIE0PQj4Gg0csmaE5KMIPK3PRllokdI84gIvCOfrHp2Ke5ed1kTpsy/
	 ceVddjuxapAOB3BbPsv2V/ic/E0R6ECy/Eqr8rCJNJ4vSxOE+vzBjKIAZhSWCysGUF8rM
	 z7J0WzPsHZOxafg8i0SAKznQ63Q8cM+ZS+yw489IgpTlbCyLlx1D8PcC6Abj/Rl/YFVva
	 39YmcRvydVhN++QVNx86ooCK7giyJGkRff971KrRHR/tAv/AutjVUENnDdfM0bf5C+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cC2FXJ+6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501E7606E984
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cC2FXJ+6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5C71F00A09;
	Thu, 12 Nov 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472594;
	bh=UhP6SD+jVOcQXLACldAIeRQph2vLXu3eFqLjHqhceck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cC2FXJ+6z/EQjBnpmMx69ZlCUi2bPU5n5dtoh62QToSEYDXrvZ/wpRKVaTq9mrBSM
	 cfdreIeMJapJRDi7j4PT7Vk1KEZkwlQxqZDrsH4ncqDshhvmYbZXtq4kU+f/tEsfXb
	 b0U4MuDObQj++hOTCZkoMKcsWC5SxhoRdLoXuB9b2qZ3ME9hcSY/krKw8JQyabbHzY
	 SHFNoo2ys0DJK06GkUXSsXgDq1iDiNHkZYQOZnZpws1bJUukxMZVv6WGiA8nbVyZLg
	 LQNAO3J71gjVqA3TbDktYL3fyMGlxxIZnd4+x8sv83kb2/49IS/kp08nsi5usgRUso
	 I5McxQW6+KEig==
Message-ID: <sashiko-outbox-210747@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: typec: tcpm: Don't cut a pending state
 delay short on a re-queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-tcpm-attach-reboot-v2-1-b4bc6ca83490@gmail.com>
References: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
 <20261112-tcpm-attach-reboot-v2-1-b4bc6ca83490@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:36:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> tcpm_state_machine_work() applies port->delayed_state as soon as it
> runs, assuming it only runs when the state machine timer fired. The
> work can also run because it was queued for another reason while it was
> already running.
>=20
> This happens at every port registration: tcpm_init() runs with the port
> lock held and calls tcpm_set_state() twice with no delay (default state,
> then PORT_RESET). The first call queues the work, which starts and
> blocks on the lock; the second call queues it again. The first run
> handles PORT_RESET and schedules PORT_RESET_WAIT_OFF after
> PD_T_ERROR_RECOVERY; the second run then applies it at once. On an
> Orange Pi 5 (FUSB302) the log shows the 100 ms ErrorRecovery taking
> 6 us:
>=20
>   pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms
>   state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
>=20
> so the "clean slate" that tcpm_init() asks for never happens.
>=20
> If the delay has not expired yet, re-arm the timer for the time left
> and return, as tcpm_send_queued_message() already does.
>=20
> Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority =
for processing events")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-tcpm-attac=
h-reboot-v2-0-b4bc6ca83490@gmail.com?part=3D1

