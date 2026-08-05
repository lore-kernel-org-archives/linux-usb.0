Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E53D25B2;
	Wed,  5 Aug 2026 04:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905942; cv=none; b=D7fXHGqZv/hxjICB6hSCqfJoFrxbdejy19pYu3cOjavc4AUtnCZPVyMYYeyVru0XQZ/a41ZkZuvifoej46GJD0HXvjrdE/1QBkEnrxLLxPC4EgPkOj3hQML6j6nRg58mhMoYU26V/EMrEfSgRRn2eO+4oSN9NB4f/OkDhxNimhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905942; c=relaxed/simple;
	bh=MZmm461u8xljhIgm5nbb5kvC9WjybCrqfftmVDv+EFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuhaVttpC9smQke0MFR0yNJDxX6xEiHIdICSwizDEQgFbA8o3ek1jdrOxkBywKAh3/FuHFa+UmxLL2PWL3J8RkXeZViry200qKu69oAPc6NDu74iXaZLS6baC01ZE9qYQVM96jsnbPKhwD9lEYZDqsY8f1ZlqWOFM+4gmVPnKLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fO3wSEil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fO3wSEil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4109D1F000E9;
	Wed,  5 Aug 2026 04:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785905941;
	bh=MmFBnvLBPCjMG7tKBdvj5q0YIOOuW7ooKlqu0SdJuFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fO3wSEilWRZrzhPpi95IVCpuM4SwX2G44c4a/0s8ZahHUQ7DXFv2VUlskgSkD5K4J
	 /7pTTmFrg0u4VKbqFD75XzQWiviARrChoQPLgXSbXVKN+Mg/0OqM3nZ6HirAL41BN/
	 Z/RqqWtI/Egm4RSDaCRqmR8+k6Km8RZHU3+jBmC4=
Date: Wed, 5 Aug 2026 06:57:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026080515-emblaze-tweak-bb22@gregkh>
References: <2026080445-dyslexia-shell-2db3@gregkh>
 <20260805040813.3194227-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805040813.3194227-1-khiemtranzo532001@gmail.com>

On Wed, Aug 05, 2026 at 12:08:13PM +0800, Nguyen Quang Le Kien wrote:
> On Tue, Aug 04, 2026 at 08:21:00AM +0200, Greg KH wrote:
> > Please always do that before asking a human to review it.
> 
> syzbot actually already replied to my test request in this thread:
> "This crash does not have a reproducer. I cannot test it." So there
> is nothing to wait for - it simply can't test this one.

Then you do not know if this fixes the problem or not :(
