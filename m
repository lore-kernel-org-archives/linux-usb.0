Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF434331A41;
	Tue, 11 Aug 2026 05:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786427718; cv=none; b=P8f1vyZf4aIy+y5c+ZvKoCNrpBq98qNEq46BbvN7AboKFSysp3XtUc7XqYzoiyieo/sL6oAvwyNaOz+GaqDDCFXnMuLIpxhajzpk3pcKNWqyrhepTI7IVYY48/Uj9AFMjkrTtkAoiExKaAlq+25cAcfOFdhuQ4wYDNPcHu8ihvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786427718; c=relaxed/simple;
	bh=wvVgCVyvfn4QrB+NWADkKdZ74w6cH1ZGOnoJMezz/+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGdpHVqdDij/wbkYJCwDudgrPjpc4kom+f83XOCVh1UanGLO5vzhav2fc5v3wOTg3a9DXz8jMwPLDCXYmJa/I19Q3HsZNQ7MZ9EI5lNG63fxhmmxwVG4kg5lubpA1HdnHjI/iNLR3YluENuzxIF1I1TQq537Ouk+FMVrmhNSZSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KMxRVrWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KMxRVrWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98871F000E9;
	Tue, 11 Aug 2026 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786427716;
	bh=7nQavmH/0W6SwTnK+YXVz0BSlt378b0aLAdiyCtEqRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMxRVrWv7e90VG7kO/SCrvDCBRZAC3KCiGIpsx6gzDCmiGHfgT19RXQS4mC1QrHoE
	 V4pLa5wAmq2ijflBI+SMBCm2R8x6Q8nmAr+xjVOvT0Vw4vY77/j8tX2CaMc+qnfK9E
	 B1TsAw5gC6YvbgKBFAkRGQ4iioH1xcvR+2QQ9g1I=
Date: Tue, 11 Aug 2026 14:53:43 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: heikki.krogerus@linux.intel.com, pooja.katiyar@intel.com,
	johan@kernel.org, pmenzel@molgen.mpg.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Add ACPI_COMPANION() NULL check in
 ucsi_acpi_probe
Message-ID: <2026081107-paternity-ahoy-ba14@gregkh>
References: <20260811031047.399164-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811031047.399164-1-luoxueqin@kylinos.cn>

On Tue, Aug 11, 2026 at 11:10:47AM +0800, Xueqin Luo wrote:
> Add NULL check for ACPI_COMPANION() in ucsi_acpi_probe() to prevent
> NULL pointer dereference when driver_override matches a device without
> ACPI companion.

How can that happen?  What changed to cause that to happen?

> 
> Fixes: 1f3546ff3f0a ("usb: typec: ucsi: acpi: Check the _DEP dependencies")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>

No cc: stable?

thanks,

greg k-h
