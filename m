Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31809218EB1;
	Fri, 12 Jun 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280215; cv=none; b=JWbegsauHOxQ14KtrCCuxJ851LBYS16dHcIOJnvzKpKh8TQa0h4OJ+8a3JbsHwmMneW0PQLc/C4x00bJBE3IE/InN5mMIbjBmTLrc6jJ49FsHMSJbK1Llg5f7yM1RuC/ILkin+aYsg8BQYQR6QL/nZL6ZgSNKdHZB5iWDKJnuXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280215; c=relaxed/simple;
	bh=ZV0nFLU0SSx8p4R3QdoVIeRNjvsNFjR1gS3MqAUXpxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaXY8gmvh9rqP/d7HZNDJUewi4xQDVLLtUNWOyh6BFlHxAgLLksTiyjEi0ox2EEvcrJSSE2Im0Zpczxqw39NSD/QD4CC04kwxqFBYal4nF/3wGruPvyypz6px+d6UIbmVu0d1ylekcV3ZNA/s6wzIwnbZDFYixJHOtlMYfhvkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kok6oD4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kok6oD4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438321F000E9;
	Fri, 12 Jun 2026 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781280213;
	bh=mY3FNC9Hx85oQhBKwsbheoTUp3SEO8qIselu1/PuBW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kok6oD4QpvKTXXmnA7pQQI12WxRO80bZWgR6rPnOjHwQDSprWuxHWA2IsKGUXGt7W
	 dvB4HnrKK0WROkEcs/7jJSqY5en4u2YxE3lW0LvG4ySHSxO13O71re3/3KuIkNa6H4
	 JGpZR6SzP54gRTMZlz/mADEUR4ROI0RsyzRyqbPA=
Date: Fri, 12 Jun 2026 18:02:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial updates for 7.2-rc1
Message-ID: <2026061258-subside-cross-a100@gregkh>
References: <aiwsE2wLDgdC97xY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiwsE2wLDgdC97xY@hovoldconsulting.com>

On Fri, Jun 12, 2026 at 05:56:03PM +0200, Johan Hovold wrote:
> The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:
> 
>   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc1

Pulled and pushed out, thanks.

greg k-h
