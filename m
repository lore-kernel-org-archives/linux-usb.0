Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928C34F26F;
	Wed,  4 Mar 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639335; cv=none; b=QAeaogBkzI1FgdSelACDL0Dij7ww4DGfzkzJxA4GM3c0eDf2fqZ430EfwjhGaqV9qf06fDlffS2aPdoZ/7B+or5wc726030xmWd0fzaggrfylfWdiuVkRKNVY6TCQWTIs5eknt4mooWa3+GsKkqx7q184F6t/+0bnDHtAgdc/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639335; c=relaxed/simple;
	bh=2dsWNP2QpkwFRLpOLC9c6gjHPKPDIak7o2vRES/CVRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIp6/YsjEzmlz3xnmf24NP7N3UE4FaR70mSF278IAgyCeMM+PaR/1rI3BjKjKpHwUpgHICph+8pzRP+Wbvi25Pimqv2BtWkoPoin5FLx5jL31XY9/LbMynOlbKcTDrGz5RQUTJHdAG2SLNqH1N58I9luHkKwW54/v8PJ425uuRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ujGA7U0L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ujGA7U0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CC3C2BC87;
	Wed,  4 Mar 2026 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772639335;
	bh=2dsWNP2QpkwFRLpOLC9c6gjHPKPDIak7o2vRES/CVRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujGA7U0LrL7zpQcPqukhRouzxPdU1GPnucTLqikOT2wNMPhV7iptKFVGKrda+HqXi
	 wi42/59cpO1Gs8Mn0/jeImkrh4VG/v+54EayMy05KxvnuJPYYmSXpq1npOdHkYOZth
	 JN1xKRCaTjUNFmTAFzjj7vBzBTPyEtxdMbkHiJ/M=
Date: Wed, 4 Mar 2026 16:48:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: remove unnecessary goto in
 usb_create_newid_files()
Message-ID: <2026030425-animation-doily-912f@gregkh>
References: <20260304154216.2750-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304154216.2750-1-marusik.adamenko@gmail.com>

On Wed, Mar 04, 2026 at 07:42:16AM -0800, Mark Adamenko wrote:
> The goto to 'exit' only returns the already initialized variable
> 'error', which would be 0. At that point it could not yet be anything
> else. Replacing with an early return 0 removes the
> need for the label entirely.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
> v2: fix missing return statement at end of function

This is v3 :(
