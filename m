Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561FD336EE1;
	Tue, 21 Jul 2026 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639685; cv=pass; b=jb83WThnvb6axI/m2uvGKIy6ZPEU71TQT7zD9/Mf38scxWlwcMUHH+S2rfjZ0khDXrOUXuAK3qJzpoHP5BzkIMneZ3yMEC+xLpOV5An2z1BFYasTd47vioiPlYBKaVsjR3TsVVqZKY4sSDEz+gmO5y7Xv2u0z/jZFqYYwsZghcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639685; c=relaxed/simple;
	bh=PHW75fVCvQcIcSWGkb0hXZp5ryMs8/SdoE0rKqcOrgg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y5SMfBFXPKONJiuHcRsd+9seZgf99hsniuvBbZlwpecFyFuxZmTFJ8T6mVB+brT28GI42gj443T236BaM5pTJGnLISt1jQgaXvxCMiHyWRjKycupGIGTftlmKpwtsJERYYH8gK6JKzgH1WbcAEDh0+QcWEnYq8q8q+iyIIBas30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=DlP55lgd; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="DlP55lgd"
ARC-Seal: i=1; a=rsa-sha256; t=1784639673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TEnwMVmRD0Iddue5D3H/h/mqwuX9qPaF0KOqvVa42vXoexP4Z3gGweRmcqSDf6Zqgsk7oVE2herHvagyAv5FsTUNM5eHM4zUVJ5+wwxrorAuQO15h9pkiMRBd/w7iQ+SuG6mTVeZuG0T79/yrPKkVYxphdDaKbx4L93UK75SIiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784639673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PHW75fVCvQcIcSWGkb0hXZp5ryMs8/SdoE0rKqcOrgg=; 
	b=ArvbFM6s84aM+c1lGv1RdSzZbSP8sZHj2URKmBWcq9kg2WsBpYn5Ky0wnCbXaQHHDIH1EW48k/FSXQooU5GQRQD72gWxqPiUbTF3zN06XVMhHfPzCa+Jk0+9UiKRrewlCaqset1OA5k/1HiKvrZI7EXO2uDEm4+7u/GqPv+5Zn0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784639673;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=PHW75fVCvQcIcSWGkb0hXZp5ryMs8/SdoE0rKqcOrgg=;
	b=DlP55lgdhdRP62/mLrmUvIPwxcELQYtVdJ7ZKoUBdy+i0aFEyapIb+2MWBv2wCFz
	A4OGA9ybkfhndZbhrR3VDMOgRadbxxsmH2xpvoo9Y6lF2ogaFMpn/n83+VpsjX6Oe+j
	gSmVEBC5if0B7qCi/KI6tPy/X5GxoRLyhheQs6QY=
Received: by mx.zohomail.com with SMTPS id 1784639672029223.96092166734832;
	Tue, 21 Jul 2026 06:14:32 -0700 (PDT)
Message-ID: <309aef89f580ffc48f52c25846d050dcf04d01b0.camel@collabora.com>
Subject: Re: [PATCH] usb: core: Notify through uevent when not enough
 bandwidth available
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 21 Jul 2026 10:14:23 -0300
In-Reply-To: <2026071031-chasing-booted-ecc2@gregkh>
References: 
	<20260615-usb-notify-not-enough-bandwidth-v1-1-09ee5098b42d@collabora.com>
	 <2026071031-chasing-booted-ecc2@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Fri, 2026-07-10 at 15:01 +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 15, 2026 at 10:35:33AM -0400, N=C3=ADcolas F. R. A. Prado
> wrote:
> > Currently, when a new device is plugged in and the host controller
> > can't
> > find enough bandwidth for it, an error message is printed:
> >=20
> > =C2=A0 usb 1-3: Not enough bandwidth for new device state.
> >=20
> > In order to allow userspace to react to this and suggest the user
> > to use
> > a different host controller, send a uevent with
> > 'USB_NOT_ENOUGH_BANDWIDTH=3D1' to the root hub device.
>=20
> Where is this new user/kernel api now documented?=C2=A0 And what tool is
> going to be looking for it?

Sorry I missed that, I'll add the documentation at
Documentation/ABI/testing/usb-uevent in v2.

As for the user, Steam will use it.

--=20
Thanks,

N=C3=ADcolas
