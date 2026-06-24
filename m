Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA53093B8;
	Wed, 24 Jun 2026 06:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282575; cv=none; b=cOiAf8nWNaXZ9O6PInuN/l5Bd0HfJcFlx8RzrAkRSlal/36ldovlPQ/Q899MMr4dHLza54VSwHRYwAxpZwivriZVyHUMcsjuC10V2JK1/uPEQwZAcBAAEnEP1yCSa/A5mGMU4c+HSJjYOQc4DZU/cSyHLBPB0SPqufnjUgBRff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282575; c=relaxed/simple;
	bh=nTK6VoPsTcHzUGTtgf9E8PSXIKQ5VmPDEatE0m8tAg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3XyPE5uTajF4YGKDjDGfHty2979WN5PgR0/7/FfliZ3sjUed1XKLDR29lkd4GTz8eTnuwJXQA+Dz6Op7yi7n/jQBvgNx+nQAzI16byGuAQPtm6qUIuJPv9+LaTCyQiWnkcSRQqEj/o2mzXXNoC6o4TCArP3Y455syqvsgkuilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bSuprmpO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bSuprmpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7AB1F000E9;
	Wed, 24 Jun 2026 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782282574;
	bh=nTK6VoPsTcHzUGTtgf9E8PSXIKQ5VmPDEatE0m8tAg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bSuprmpO/X/homOVAOforB/5NJ3ykAHzcodp7IbgpjH/a6bWdCtCvM+ZRD0L5OVPr
	 THwrScfHuPgLuM+zXfS3v8YozVux4YAv2IkSFFAoDJJszvALmD7NIa+mX6jSFu4wtn
	 UkEudITu6TUyt3KfqYJt19MwyX9jaSbZzwgSWo8c=
Date: Wed, 24 Jun 2026 08:28:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: hub: fix coding style and prefer unsigned int
Message-ID: <2026062445-reissue-calculus-baa3@gregkh>
References: <20260624061734.28479-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624061734.28479-1-andrem.33333@gmail.com>

On Wed, Jun 24, 2026 at 03:17:34AM -0300, André Moreira wrote:
> Fix indentation issues and clear checkpatch warnings by replacing
> bare uses of 'unsigned' with 'unsigned int' throughout the file.

There's no need to do coding style changes for existing kernel code that
isn't asking for it :)

Please stick to this in subsystems that explicitly ask for it, like
drivers/staging/

thanks,

greg k-h
