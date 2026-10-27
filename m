Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113855;
	b=GDL7/9DarcD2cUGEGbpyYF+77KyX/c34/OFu2MR0YAdqjDdYl5/EtuBXMN/mVVYTkmdb
	 rSMoheiIcqokUsMAjnV4cs7w+CA3loDrhina4NLcWbOFe52S4WbmgucPPSoNLg2zSdXI4
	 jB2J+ahVSHini83VtrliyB3I42WjRmKIh1YLByQJGR3rPX1ZCiKZgd8/KMDssjZwLNmFK
	 9RsJ+svbnpG9R4xnSrVFDlwdhJZif/mR467SQZBHVJnuRSgQBFN7lOtqXdolHQgeaY+hb
	 RG+cmrHgquctGiNh9bKHYFfmBRXHLl77zCNyoSHwx9VLiBx5QlLXuu7rwGrqsBIhedw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113855;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1FT7QV+9hAX7IKQhktN6jXOKjW03/2FBt3aH6UILkRE=;
	b=AGJlraPNSBGENhVVOeqb7A8m1gQll+Mh5LGId46v/8WSs+8NSlRhfquLucm5DAhmgKdg
	 fXjQjBYvKDsewB+pAKJ2wwGRyqXQ/us4cwO0jSRWkywPv3+H7BaVzyKiTxoLlfkLZGMet
	 6E9jdTILDn43XxEaG5aWoG1Guj5V8xKTt3CRFOerbOQBGW72G/Upt7KsTlxflCOE+7LHf
	 mRn6hvY4VGu2KZ7XYaeI2D3bUyGlxNHezRNcfChVhSzxDrY6L3efpJiWl1JUQI4ZhrVZJ
	 ZEHVcH37sYKnTF0n4Gqlrjor+ejCH/cfJp8x76/qt8NNYvOhZtlDsAhwyZiRuAXe7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gptgIWwJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256C606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gptgIWwJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB851F01825;
	Tue, 27 Oct 2026 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113855;
	bh=1FT7QV+9hAX7IKQhktN6jXOKjW03/2FBt3aH6UILkRE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gptgIWwJP/LcEwp4j94mBKMf/q5H6iMymVy8/J3hjNnzwQuSIc8Iv309EaBrYkrS2
	 QrRV9fTitW8+r6dJg1heXgRvPeW7pK6aoIPQXtgzHO5P8uDt/UQZ62fVE28Z382d6S
	 UqhUAbsVTdjK/b9DEfxnCLCKQdnfDwam7y+7m5k/aax+vtnJXhprWRI36OBddIIHJ4
	 xdJedrmT/Z0sQuR4PEeM45T2Bdb+IZwp1oiJwr02Mrp76wlBxyc0uxKi9ofoU+2CEU
	 52VTWxsSRZumdtjTLjzMyrcTlqNJDb3N1dFlsLNCHDDXFGHF6nYtGAmswSlq7S4Iiu
	 NatfhmlsxYkig==
Message-ID: <sashiko-outbox-186808@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/19] usb: typec: anx7411: zero on-stack alt mode
 descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:10:54 +0000
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
> typec_port_register_altmodes() and anx7411_typec_register_altmode() fill a
> struct typec_altmode_desc on the stack member by member: svid, vdo, mode.
> typec_register_altmode() reads three more members:
>=20
>  - inactive: a port alternate mode is registered with active =3D !inactiv=
e.
>    If the byte of stack garbage is not 0, the mode starts disabled and
>    typec_altmode_enter() refuses it with -EPERM until somebody writes to
>    the "active" attribute of the port;
>  - mode_selection: the DisplayPort and Thunderbolt drivers enter the mode
>    on their own only if it is false. For the partner alternate modes of
>    anx7411, garbage there means that the mode is never entered;
>  - roles: decides what supported_roles of the port alternate mode shows.
>=20
> typec_port_register_altmodes() is what tcpm and anx7411 register the
> alternate modes of their ports with.
> CONFIG_INIT_STACK_ALL_ZERO=3Dy hides the problem.
>=20
> Fixes: 183b194d8fb6 ("usb: typec: Make active on port altmode writable")
> Fixes: be727d400066 ("usb: typec: Introduce mode_selection bit")
> Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D13

