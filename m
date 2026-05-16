Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6033E4C8D
	for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945859; cv=none; b=e/Ag7zkoXoX7N4SRENl+ZtznC1ty/fZs/rucR19bWJfq64rRyn5cGrPPLdBMJu90yWKyVX4EDQhbYSQe7em3RKmm4FtO62VUBA94ZGK0CEY0MVM3H1y8zp4pelV05SQcsjo89snKMkBavrbOV2eGVXadADg1ejjQ6OfsRxR212A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945859; c=relaxed/simple;
	bh=NUb/8cpN5hyx6GVgJAYLfxmZAo6dexGEu+u3sF1gKmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6kQ44ah3LM51ZiuDOQq1t6Ql2BrkyfHE+VOOWWMFZ39FfXI+NZaECGP3yLfXAJZaQtuNxBsUYLlfPCkANlf2R6utMkTIu1UlO6FU3rBolcrSWxC2c79fTrzgkxrTiw2yrvRt5f4kQG32EqKsSHXbiFxiDcUsl0175BKnNbT1a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iAKOphie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iAKOphie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BBFC19425;
	Sat, 16 May 2026 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778945859;
	bh=NUb/8cpN5hyx6GVgJAYLfxmZAo6dexGEu+u3sF1gKmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAKOphieWgLrxbbQUKDy33jccVScgOzzZDqpW8JFBfxYt+Cwm9HBOISfPuTPcgLrU
	 cG69zeN+iFSIyB7FGoCUjwcaC6ebsetxcXoAMOMoQ5H2l0fsNeDNQtf9VJh3Jo/j5X
	 BKXeUbZKorLz+KqurLnhcq80LUi8SF7Te5EiQ4hU=
Date: Sat, 16 May 2026 17:37:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Elliot Tester <elliotctester1@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: legousbtower: remove changelog, tracked in git
Message-ID: <2026051626-probing-pager-36da@gregkh>
References: <20260516151041.46180-1-elliotctester1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516151041.46180-1-elliotctester1@gmail.com>

On Sat, May 16, 2026 at 05:10:41PM +0200, Elliot Tester wrote:
> The changelog in legousbtower.c is no longer maintained and has been tracked
> in git for a long time, so I removed it.
> 
> ---
> Changes since v2:
> - Added change notes for both the v1 and v2 versions of this patch.
> 
> Changes since v1:
> - Added a body to the commit message explaining the rationale for the change.
> 
> Signed-off-by: Elliot Tester <elliotctester1@gmail.com>
> ---
>  drivers/usb/misc/legousbtower.c | 61 ---------------------------------
>  1 file changed, 61 deletions(-)

Please start your kernel development journey in drivers/staging/ which
is there for that reason.  Don't do it outside of there until you have
the development process down pat.  The numerous errors in these
submissions, including this one, are a small sign that you might be more
comfortable there first.

After you get some experience and know the process well, then expand out
to other areas of the kernel that you wish to contribute to.

thanks,

greg k-h
