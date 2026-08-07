Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907B472F7B
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108318; cv=none; b=QVXR8XbnXlhvTcX5Zyi196beZYPseQZf4HohatKpX6YCPQhobPZR/GaIelOePF6+ONqCUgJampvEbWv4WPJRZv3M8hRKFUda6xFxhsLwQ6PUrBtDMJjpAGzZXMqmUHoV9REZ/VjPuyH6dx7aRHnQ9mXI+KHERI1abSt4zVeHhw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108318; c=relaxed/simple;
	bh=STbM0x+8DHOcJcc8IwzrFW8aJdJuTmG1iS7phVK/t4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpV0I0z328DugvSJW4dIXMB/JwOkpKeXFYzr4YnuV/mCVfC+FgxQ3G270wDuFLX1/YYCRT3Pgh0P4cG/eMzj163grgP2MNi23rbCFCd1a/cPqYkuXe5FRbb0PrfKugnuEVUmuZ/0LuJ1r4r8U5WKztJZOx7fTPgYJLsNTQWmxqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UQBwhA+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UQBwhA+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353D11F00A3A;
	Fri,  7 Aug 2026 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786108310;
	bh=nV3pCJGyKhz/exggk7FHchal04SuGbCZUP2ESy+2H14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQBwhA+Oi7xa4h1wgAXma5cH1qc25Pr7u77b5ud7Pd9DwfKJFow19LU1YhM45pyaL
	 UK+W1DgiV+ooU7HfJ2v3RDs8+7MF9zMkRafsz71sMpmWHQPZNRgEv4DO/uhoOLXmtv
	 YWVieigsy7CM+vgBrg3AAE7iGM+U70uGVMvx9RtM=
Date: Fri, 7 Aug 2026 15:11:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
Subject: Re: [PATCH] thunderbolt: verify PCI resource type and size in
 nhi_probe()
Message-ID: <2026080747-doing-humongous-c14b@gregkh>
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
 <20260807113113.GO235112@black.igk.intel.com>
 <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>

On Fri, Aug 07, 2026 at 02:47:54PM +0300, Dmitry Antipov wrote:
> On 8/7/26 2:31 PM, Mika Westerberg wrote:
> 
> > I'm actually not sure how this was even triggered
> 
> :-) just as documented in https://docs.kernel.org/driver-api/driver-model/binding.html:
> 
> Userspace may override the standard matching by writing a driver name to a device’s
> driver_override sysfs attribute. When set, only a driver whose name matches the
> override will be considered during binding. This bypasses all bus-specific matching
> (OF, ACPI, ID tables, etc.).

Yes, and anyone who uses this, gets to keep the broken pieces of the
kernel if they attempt to bind a driver to a device that can't actually
support it.

This is a debugging-only feature, don't treat it as something for which
EVERY driver would have to somehow insulate themselves from.  That's not
what this is for at all.

thanks,

greg k-h
