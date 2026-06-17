Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F835957;
	Wed, 17 Jun 2026 02:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663512; cv=none; b=MmKMk58lVlY8mGqIizyIvxJ5bHHpPVEsHkg+Bx5rNrTme0U57VpZj1zr1c/4bbIOwthvvHT5LSC7vvtqIJRlzjP9rUXhsYReoC0JRPlgad0k07Ed9NvAiQKxyk6iBMk+SvJDBqZcDnDCyJ2OAaN154ht3NEzdUXcfkrP5A2i5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663512; c=relaxed/simple;
	bh=Owd/4nLIHDRuXo4+h8ViWw6XlEVQugldrO37unKD5bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1keko9DkqK+AcuqGJEdZb6erq6UdZ+IX0Q4VelP0MT4g5zOiGO+0TmAXQVkDw41K5R0RAR8WxUXB2HnyAlm5oxOycXoO+VMrrw37eddwym4biHJyvTCKuvGGhlPvSLWMWvV/dQlZBMTkRI8dGBpS5F5athkQcaN1GskaCsSkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=glWgajwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="glWgajwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE121F000E9;
	Wed, 17 Jun 2026 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781663510;
	bh=e6JNUAqrBSoL4xGN3id+pA6tOrmDo+Bp4P3gDvq5Ksk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=glWgajwVYZK23MK4vUci2xm/U+9XWG9ZsZmdiopIcmxL25EIDW8zVL0N09hw5nxHS
	 Phbxf4GsALdmZGYbqW8ovxpFuevirBSgy8+rVzcKev2zpvo7jPOPZay11b6izbw/NL
	 +Ey5crAr9wW312SAiRvVudzpTmmiqNIY8Cb3XFYc=
Date: Wed, 17 Jun 2026 08:00:45 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: 18392868223 <18392868223@163.com>
Cc: johan <johan@kernel.org>, linux-usb <linux-usb@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	yangsizhe <yangsizhe@meigsmart.com>
Subject: Re: Re: [PATCH] usb: serial: option: add multiple VID/PID
Message-ID: <2026061731-emit-penknife-c0dc@gregkh>
References: <20260616095631.7424-1-18392868223@163.com>
 <2026061638-skimming-composure-1b23@gregkh>
 <6c20eec6.114e.19ed3356c3a.Coremail.18392868223@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c20eec6.114e.19ed3356c3a.Coremail.18392868223@163.com>

On Wed, Jun 17, 2026 at 09:32:34AM +0800, 18392868223 wrote:
> 
> 
> Real name：MeiG Smart Technology Co., Ltd

Great, please add that to the changelog text when you resubmit.

thanks,

greg k-h
