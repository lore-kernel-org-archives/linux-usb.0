Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C10130E0E9;
	Wed, 18 Feb 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399766; cv=none; b=USKgeZUbj/CVZnWyLRy17ri0bVblhyn1eaOnG4MFbowCcdJX4xyZ1+S4LoG4HvqWGgS43ZJtf5I/+zvfgaWIQ+jb8esauq+HcPzhxpYPGe1hBqdPPk0V3Zyks9ojjGHakq1dn3/9NjczlUoMS1S2rZzqCUNqLBDoXvwtPPy1irE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399766; c=relaxed/simple;
	bh=9o1Uf26FGLsF7TAIQpX6259LEBsIRZn0h+oKl4VsFdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay5strPEZ+W/I2Y/BAWZaGxAFigZjfFKbSsZYvNnQhbyqr8PpgGFmwm6Vh9DtPUQOYloWk/DVroOnKp/URhcC+GiVX0KSGMurNHsR9Op6E/U+I+7wW1rm5juyZ9Xmp0j/DxWauUc3zuY0lj3lK0pySp3EDaE7j8XayC79Q/ULGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jHYKVhhl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UAVtArrx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jHYKVhhl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UAVtArrx"
Date: Wed, 18 Feb 2026 08:29:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771399763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tc9wYhIQIs24bZdmG0gaDLK22NIlwlVkm9cSNby3yaE=;
	b=jHYKVhhl5Elie3YYwS11aymO+sXeMqu8hjln0rQCtm1oXGjIicye7zZ0pOm8Vb6A59Fj4g
	iVzpds1UwVlXUyBuUojeEkp9P0o0f63CW7KhgelnLSvZY+40XlSfMpj7esr8N18kzf4ncG
	qZ6Vnmjx3hpg1vG1DdZCJle+pHUAJ7xxVc6Uyy0bXVVte6XZsOmavAi31FYbRS0XgMs+rm
	9A59opfaWJ/MLvQBUM5N8AYfaaSomQyicgaxdP6q15xoPUI0DhTrOIHe2cwChcoMoKMomy
	qfU1chibKZSy/ETJl+kpvlh049yqHyegavOYsAhs5tbFmsevy672rfadMVaK8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771399763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tc9wYhIQIs24bZdmG0gaDLK22NIlwlVkm9cSNby3yaE=;
	b=UAVtArrxndOArnaxN0aKpb3+Bq2z/GPmoEAUOLtHqwwZlxgFtroOQK5e1Cx2JzY3U1VH60
	45+2ccN94dAII6Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Yufeng <chenyufeng@iie.ac.cn>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Message-ID: <20260218072922.C08qI5s1@linutronix.de>
References: <20260216204848.10748-1-jiashengjiangcool@gmail.com>
 <20260218052219.l7gfndrn5e4h3qe4@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260218052219.l7gfndrn5e4h3qe4@synopsys.com>

On 2026-02-18 05:22:21 [+0000], Thinh Nguyen wrote:
> > Fixes: 08a1cb0f65fd ("usb: gadget: tcm: factor out f_tcm")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
=E2=80=A6
> While the patch itself is fine, we should prevent this situation from
> occurring in the first place. That is, we should enforce the config
> dependency and prevent the users from removing the nexus if the gadget
> driver is bound. Likewise, we should prevent the gadget driver from
> binding if no nexus is established.

Is this an actual problem or just something that looks like it could
happen? My memory is that the tcm holds a reference on it and the
referenced commit just split/moved  the code. So if it is a problem then
it should have been there longer than that.

> BR,
> Thinh

Sebastian
