Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD06367299
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 05:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342782; cv=none; b=GH6v9/PYZfLEzMohoezqa6msuYkQ+XFn+sRJQe1qnU2ePSsgZC7nuRBz++9J/KDSwoZg//oV7YK9D8VITQ83NWhxpYN52rOwE7ZpryooS0aqccnm3+YZoBhwtKay8syp9+2vC6tu5e9UZTc+t3CG6gSjpZP4sBDj2Pf54Tvh0bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342782; c=relaxed/simple;
	bh=ZtEsAmklkX+ZrUR7kZT+B+qoFyHLTdDgdNZ0PR2cwxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPACivsZkxB2WqlMCwCTY47qddCVHymhhbe2EXg6VnCs0QLBTKTql9zq0ZQSJ7DLl2O68VIR2RZN7+tRkesot1tALLeu6Q5DWveCV/8BXt+/sWwgZVnXDjB3QecRCafsvPY26hayOpYefOnQaJBHVGuXIEyVB/7L2wj4l24fzu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mld+vZ3L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mld+vZ3L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9DC1F000E9;
	Thu, 21 May 2026 05:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779342781;
	bh=KO2PmRM2VW5zBp4i0PgjSax4OfjyFhIGcoeJgGcs1Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mld+vZ3L4LOt8txQgYm8uX1F/hg7ERyL6UcinPQ/rvFUVVgqB8oWIGfDiqN/kR1GT
	 a2+xBcmc4AJ/a2MfpAHlKONgDqjjCDSjMEK6TfX2ADpyG0SM1f0q7Cvw03PWsuC0wX
	 kyG2GMpk089QdDPwnyjHjn66umAUT7lrOItK84Ns=
Date: Thu, 21 May 2026 07:52:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brent Page <brentfpage@gmail.com>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
Message-ID: <2026052101-spookily-grid-d40f@gregkh>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
 <4C69D317-184B-470E-87E9-4337547C78DD@gmail.com>
 <705CFCA1-92BF-40E8-B036-3ECBD4F557F6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <705CFCA1-92BF-40E8-B036-3ECBD4F557F6@gmail.com>

On Wed, May 20, 2026 at 10:05:39AM -0700, Brent Page wrote:
> 
> OK, a coherent set of additions/edits to the patch:
> ---
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index 7c2f2125d..04cf55484 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -1478,7 +1478,7 @@ sitd_slot_ok(
>   } while (uframe < EHCI_BANDWIDTH_SIZE);
>    stream->ps.cs_mask = mask;
> - stream->ps.c_mask2 = c_mask2;
> + stream->ps.c_mask2 = c_mask2 << 8;
>   stream->splits = cpu_to_hc32(ehci, stream->ps.cs_mask);
>   stream->c_splits2 = cpu_to_hc32(ehci, stream->ps.c_mask2);
>   return 1;

Whitespace corrupted and can not be applied :(
