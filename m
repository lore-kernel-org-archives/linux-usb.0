Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE30A3F54A0
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005238; cv=none; b=di2FiW9gKaPWiYauIIJwvbmKg+wU/Pxg0FgP590Se5g2KxRkG1N1hEmuTnDMksiPXoxwio7MwmvpOHxK3uWLG20HLEKbftvXJmEWOI61sB2nAUtU/xZX1QF/YJe2CNwrtaavDmZl6LEUxdUXWWw8BYXKdcz0PEXBudmdshq7KX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005238; c=relaxed/simple;
	bh=08etilOiLV/eqtD/7dFNsr0d8+xjQK9MCmw/28v690Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HXgI2rJojV2Bp1lLAbitgA7gSJfHqrWb1087UTZ/c+Qk2rGgDzkCXdFREM3NRu+GFbopbWCqmTY8al1F687uxqBY3RHhgV68NNLSSoGR5qSo5i9GrwtT0u91Fb+DcfvOnL/KU+oEK2+Hm+4NFtGmne0/htFwkPtnH54HpxaoGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duIe/sUo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duIe/sUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B1C1F000C4;
	Wed, 14 Oct 2026 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792005236;
	bh=08etilOiLV/eqtD/7dFNsr0d8+xjQK9MCmw/28v690Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=duIe/sUonZH6v+xprYN3TVnRdz0W0NR3LZP92qGmmOt4Rh2gXZLDBFdeJP6W1t+2M
	 humLRjOfxFrGCKR7B22I7xuHxBbDlDff+mUYtOPdo3uiSkCLbyHDZBbxWN9VTtkWGs
	 Gz6EZlTHMaYiQVpkjAfh708drxTSk8RzGReSUKbidOq9rIhmyDsq8BnGs4X//hRWrZ
	 bhk4HCG6tWcmvZC8TxvE4kIJQQQUIfkLMFP04P13m85+w66kYomOW7o4F6WSSMKVFF
	 3aQvRv1U/Is0Sfre7FV1E59+IYjqIJ35AcaBjycQEoCzrEB0v0hggi5U/JLRNzma17
	 Zl2gS3OZDI1Ig==
Message-ID: <sashiko-outbox-171770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] platform/x86: ideapad-laptop: Evaluate ACPI methods
 exclusively
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxpIEFobWV0IE1lbWnFnw==?= <aliamemis@disroot.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014190544.150093-5-aliamemis@disroot.org>
References: <20261014190544.150093-1-aliamemis@disroot.org>
 <20261014190544.150093-5-aliamemis@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 19:13:55 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On some Lenovo IdeaPad and Yoga models, GBMD, SBMC, SALS and DYTC hold a
> shared AML mutex while waiting for the EC to finish a command, long
> enough for the UCSI and _Qxx methods waiting on it to time out.
>=20
> Evaluate all methods with the exclusive helpers.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
> Signed-off-by: Ali Ahmet Memi=C5=9F <aliamemis@disroot.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014190544.1500=
93-1-aliamemis@disroot.org?part=3D4

