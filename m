Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677728;
	b=OvjGZRqD8/6qfQtTN92RPA6FlWCEcGNYaRdSYyZO95pJvOeEVuHkjMu0Cod3yijJ4TSs
	 mEljT8sYtTUAkDnaDh+CO9knEk0dBNFRRH/ijvzYyjlyzuSJ68E7jL1tAJQD4Rj6H68xT
	 VIOBHquHuSfJrZ9XJX4WfLSa2Dprsu4E/DgJ8E4OMBSsVd4+txv4BhJtrbA4mbvHDToT4
	 dzCufBZGEII/sElgxSkFuuIHZLK4RmVjVDFDP3oTIB30TM2mldosIZ5fefGnqlelDzo0K
	 UKa4UE+XpwjqBBsL2Gh15CLQXyot5dHUTQ2ZUlj9exhY3MjzzskjLwPdApxvXuEDbtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677728;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZfwdF+yM+nzp1+TJRVjvJuwz9hVg+QF2GPdiXbY8+5s=;
	b=wiEidatQiCrgiKhZ9TIp3GBbpDBFpe/8c5+3r6y6lUSbTCtCLohCL097jO0YFV1I6m6W
	 KJAJB+5jGjXjSv+0arI9tTnEGT1e0BfdLobeqw/FLKeWaaOHUZW+EFP4JvLiJYIM27qh1
	 MLjmmR7ymv9kre5/oPQGYTn9zWRaLt8Amnh5zrsTQIPtsxIyzWUxnSuAWNS3JmyIN/74t
	 DeW9gkkTjBfPJit/UTiamvouOhTE+FO6iW3FRiOEh1mQ9nnD/0RZ0KfLt/kuGdSZcqn9e
	 WdQgAem+MOSFBM/iRRXrEm9CD8cYktWLAlqr6LikXhDIB86BAKs2wFiIM64F7jampyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnUoaeXW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E0606A31B
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnUoaeXW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E471F000C1;
	Thu, 22 Oct 2026 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677727;
	bh=ZfwdF+yM+nzp1+TJRVjvJuwz9hVg+QF2GPdiXbY8+5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DnUoaeXW0zBI7R7dJPqlsNPjNMZgsNJ2fEgtbBfN/OdK+84frvbnsf4lBrdmn8iMB
	 cdrHLG6wF63smCI8kxguGsvHBs6oiCp8Szk+kKFcjwBN+Tr/FmWdpQgyM7jrkDuaTg
	 QuI8Opfn6Ied3YMa/BKoPT0gkhf1KOQdcavlBpuSaTAx0vl6DsPMWeLuTPbCHIqOa/
	 Z8tRRCno6n70iOq9wp7fuw4qo5/TQLKu8iMss6WVIQK9OGXp3oEmyB/WCSIqwpqazA
	 /HRm26XKF2EtofQqJ8KwEx0n8ldiEzxdYrjt0yCRAIpx5NIG9zpOEEdXZbcDf7Oxkr
	 klZmRBhAr3GQg==
Message-ID: <sashiko-outbox-181606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: gadget: f_tcm: take the TPG in tcm_bind()
 instead of tcm_alloc()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slawomir Stepien" <sst@poczta.fm>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022134926.1125473-1-sst@poczta.fm>
References: <20261022134926.1125473-1-sst@poczta.fm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 14:02:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> tcm_alloc() runs when a TCM function is symlinked into a gadget
> configuration. It searches tpg_instances[] for the function instance
> and copies the TPG pointer into fu->tpg at that point, under
> tpg_instances_lock. This has two problems.
>=20
> The function and the TPG can be set up in either order. If the
> function is linked into a configuration before the TPG directory is
> created, tpg_instances[i].tpg is still NULL and fu->tpg stays NULL.
> Creating and enabling the TPG afterwards sets can_attach, so
> tcm_bind() succeeds, and the first USB request that reaches the
> target code dereferences the NULL fu->tpg.
>=20
> Removing a TPG also leaves can_attach set for configfs instances, so a
> later bind is not refused even though the TPG it would use is gone.
>=20
> [ ... ]
> Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2799146a53c356f8017d
> Link: https://syzkaller.appspot.com/ai_job?id=3D51e1f189-6d91-4321-a6ba-0=
7d4eb3cd8cd
> Assisted-by: Gemini:gemini-4-argon Gemini:gemini-3.8-flash syzbot
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022134926.1125=
473-1-sst@poczta.fm?part=3D1

