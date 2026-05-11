Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5937106A;
	Mon, 11 May 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484550; cv=none; b=R3GPvo4XsdQvY8MV9kH0JM5voVL1ZQTdOztgz7kfV/5Co5SoRJrmTg9YLZDkqW+IOTPSylU6XQZiuLnR4Y7GP9qV199VSEXrD1PeCBybpURoAG15Nsfnp44VYSsADxp8TLYbvS38UBtHyRmIrIHWkqLk2+vR2YeFB6PdIZx9IbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484550; c=relaxed/simple;
	bh=/JhDqShkknd0qrxAZQr9/uWOZb/ADlbOFBJz/oFt9/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUchv6wjwGfLQyi6Z2LLL4Zbc1Q6NVWwcTNbQdty/AQv/fI8A29ZTagxYgR10ZPTJLMCTJN35pG4nSi5tK6QLQRkzs9QBH0NFBWQiDyPppiqtMlfIj18PxU1axKR8DbCQ1PWdGyJBPcpKRIL5t2ObMA77s/d9suNiapPryJr7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rYYxZLV2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rYYxZLV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19DFC2BCB0;
	Mon, 11 May 2026 07:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778484550;
	bh=/JhDqShkknd0qrxAZQr9/uWOZb/ADlbOFBJz/oFt9/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYYxZLV2YWg/+PXTyNDFEL/J+nP/b1c28L+9asstd+jqvMF/8cHv6z/tEPT1NA/FC
	 d+I9HuKbeNMXHBspirURBFCmdmDXiqlbifhlN1x4vxhjgEMvyEc8cKso6GvX8u0zSK
	 h2i2mEIdNn+tEWfi8AolgAxh7rpKqE/+KnNkTRWY=
Date: Mon, 11 May 2026 09:29:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] USB: serial: clean up include directives
Message-ID: <2026051159-pastel-unquote-b47a@gregkh>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>

On Mon, May 11, 2026 at 09:14:40AM +0200, Johan Hovold wrote:
> Include directives tend to be copied from existing drivers when new
> drivers are written. Clean up the driver include directives to avoid
> having to point out unnecessary includes when reviewing new drivers.
> 
> Johan
> 
> 
> Johan Hovold (8):
>   USB: serial: drop unused tty_driver includes
>   USB: serial: drop unused tty_flip includes
>   USB: serial: xr: add missing uaccess include
>   USB: serial: drop unused uaccess includes
>   USB: serial: drop unused moduleparam includes
>   USB: serial: garmin_gps: drop unused atomic include
>   USB: serial: add missing atomic includes
>   USB: serial: whiteheat: drop termbits include

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
