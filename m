Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617B409279
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 22:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758467; cv=none; b=BSLxx3LodA3thap2y6rKWTQ7DhNpzDN+eakHtzjcPMD+TRCXkHe11c9LBcmp68BBMoCXo70WIdbEe9Ax+m1zCyMNrX9EbRv374jcJXu6keAVmtJ8/PSCMTFr2kPMH59mR9PoFRqxlpYf1mSLs47jqLP8SeY63s0oCYFUpTZXWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758467; c=relaxed/simple;
	bh=6nmlHKowwcNtadqUjN5hETTvLTApyoE/NX+0FbU3q7k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MHY6gYUPq6/6+TAWOfHN7CpG3NoTZr1xTucS8gy1fCCt4XZnCi5OoJqTBtnrHtpq5698ngBy1x8msOEbbERa/KCJmei0ISlmUVS6NrNlpfiFkj7TQsEDHaErtnUUWW4tQQUaJvOATSTKS5rnISSte2pzB7oUJegeivZLZ1ew5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijAgO1Al; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijAgO1Al"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0132A1F0089B;
	Sun, 11 Oct 2026 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758466;
	bh=wUedUlu9smtWt/ouHrjtRHx//109914su2Ru0GJt/Ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijAgO1AlXlPLGrn69yyjDav10nCDVaV7s/ly7egzJMK9qwX/KjFqHUW1BpL2h6rNt
	 9QqKttecTZ3If6RbSCBAFQuLUM45SVE0/y9SCp63VH8N2VCDLSNc6ZKzvd/e3VjMOm
	 2BhjE6i0auz4DnD4oz26amBn7BYJKmWrkbZX1PvjLQm0SXcJB63Xm1DVfPNR1ds7ij
	 oV7ajEVGjTcyR4P6KGvvdnxetu6//mecCbKSt8KbtkCNsRl/fr7fOdkn9uvQu+O9C+
	 4YnFTJm43YDVMLdFTg+clwXWZear4zqPkaG1OItmljaQBVKT4TOF+YKPfknNvbZQdA
	 1DKxFkeknYwaA==
Message-ID: <sashiko-outbox-167494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] tools: usb: ffs-test: read the descriptor counts with
 unaligned accesses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011223445.2328181-1-sashal@kernel.org>
References: <20261011223445.2328181-1-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 22:41:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> descs_to_legacy() reads the descriptor counts through a __le32 pointer
> taken from a member of a packed struct, which may be unaligned:
>=20
>   ffs-test.c:235:40: warning: taking address of packed member of 'struct =
<anonymous>' may result in an unaligned pointer value [-Waddress-of-packed-=
member]
>=20
> Walk the counts with a byte pointer and get_unaligned_le32().
>=20
> Fixes: b9a4274699c69 ("tools: ffs-test: add compatibility code for old ke=
rnels")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011223445.2328=
181-1-sashal@kernel.org?part=3D1

