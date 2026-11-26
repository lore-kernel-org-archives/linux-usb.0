Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696169;
	b=d3LvFa6RWCMQqnpc4fqc3bAJiBtx5hJRlCY5gWaOYTOfA2ZER2LA4h2y4tjxAkGHXVwp
	 mkNd62siSwgqNSbeljPuObIbb5+12yntAEagrkSUOYeSaORyKMKRa4XnFkeMVueY0kzc0
	 WLmS1wEpdkY8gp/QD4OZ/YZ8xRCC8bgqsbwYrQ0bU8pdpZhyP8EKd+knEigh0QN3famQz
	 dLpNb4gQSklolYmmTLlg1T50GKx2/fXffyY+mu6LA2IZIF/Ekc6l4qJhHTmdrApY63XKI
	 x14egkWGGgaeVVAH4S408Smnct30ZMsm2j72eEckBKaWZslof5G6Od+e6GHUAUNF5FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BJqNT7qaQ8cx3kNYi3LrDrkwaa2kaVdYqbYWAJxSs+w=;
	b=A7RE2zSjstGz0FKPumbyoSTsEQ9dyecMc30AMRlPQVlSdQqy4AeITfha8Ibqaa0wsQnh
	 PFpofxgAogAHAj3BGHmvx71dCuW8tQP5R6osZswgD+GuONLDFNxmd6KE4G0KYm4d7ICpb
	 wweORNVrLkjgLL1HMUa7xNmznGJA3ym7up/GjSJQYTa0CGBT6LaYt5V912kzrzUBpsFU3
	 bXCKX094eVxopO0GKX+fXoIin8fH/F8Ix6Qu0I8gBayyI/XU0ODdxmnJa2TdB6/ENrt9h
	 dobfkO13EB1wcojEq99aQ7eaUwW/aVH3PakVliHoRiAOuBIdEb228aeaSsubh8PDBrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQWPEM01;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A1606A690
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQWPEM01
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249951F00A00;
	Thu, 26 Nov 2026 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696169;
	bh=BJqNT7qaQ8cx3kNYi3LrDrkwaa2kaVdYqbYWAJxSs+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQWPEM01cBroaQfJtihFe2CkXrol1M0jYjAMIqpMgkk7qi/Skjvfqdrl85TivxFtF
	 amaM+3XhDk4d7Z0TpYK0jem194FbsAk1gvuBiPIJ1iQ8qw4UlGxNu2Ezqf+IrvJJrU
	 N7iVOVDSj5c5UNcfVtCDHKkrrzHV83zCc/OsjZMPkiOE6nmKmkzXzWT3eZeBlT1YSb
	 4mIR75rzKrq6s49hbx1tKRc4+dVjL8D2DExSC0BHmCwJmwEXROUUy/UO41Ap10d3Uh
	 yaRwNZhmwM0cVM2eU9fkF57sK289fTG/5qNVripvh4VjUk9gXgLZgcLBEId9mhy8si
	 7r4BLsuNgdVzw==
Message-ID: <sashiko-outbox-235504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: image: microtek: limit REQUEST SENSE transfer
 to the sense buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Becholey" <alex@becholey.ch>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126122151.414230-1-alex@becholey.ch>
References: <20261126122151.414230-1-alex@becholey.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:29:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mts_command_done() receives the data phase of a REQUEST SENSE into
> srb->sense_buffer (SCSI_SENSE_BUFFERSIZE, 96 bytes), but with the
> length of the command's own data buffer. A REQUEST SENSE sent through
> SG_IO, allowed on a read-only /dev/sgN without any capability, can have
> a much larger buffer (252 bytes with sg_requests), and a device that
> returns that much writes past the end of the sense buffer.
>=20
> Limit the transfer to SCSI_SENSE_BUFFERSIZE.
>=20
> The bug was found, and the reproducer and this fix were written, by AI
> agents (Claude Mythos and Claude Opus models). The analysis and the
> patch were reviewed by a human.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Becholey <alex@becholey.ch>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126122151.4142=
30-1-alex@becholey.ch?part=3D1
