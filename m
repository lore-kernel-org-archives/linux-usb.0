Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EAE39B4A9;
	Fri,  5 Jun 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672672; cv=none; b=EJojK36Lho91olUEsxCoV8DvKQLXGLpKUDpDTyaRKN5MF5A3E9aWVEW3LGFWtVUBREzoJlcpyvgqjomJ2qmwmPO0LaxagJOq5eyz7ApXyOOgWAVe1FgNU97HFVxVdDIZEKq+9axLuvXNib/vHaIxcJISDraF2Wd9QguQS59fLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672672; c=relaxed/simple;
	bh=qL/kocWuaZnAxVdeQbF+5Y2f+C8GD78YeYkm/uXeW+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=st50Qa0JjrGV0UUBbEgMQMyEFlILJoxsmrbHTbI43ejckLLV/RwkPaq/GV4RfsVfDV45GKeOhP/Yb76modwkGLgttYDE+8ThN/qnaFwwEE4aGZk/E9nXQpZTX2JG/nQN2KacuTwOl9AM0YJklAuVF/rcSDI0uXlsdang8l/vbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OmsuTdMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OmsuTdMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF3A1F00893;
	Fri,  5 Jun 2026 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780672671;
	bh=R93MQWlDi5hEUr1WBhy8l15zXHoQ0whl6wr+dAZGIrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OmsuTdMVgH+pzWMtK3nbUSEzCKKZbWGuj7ATOLg8qxDvOoK2t9C4DyZH9NLd5/QHq
	 aFXqUDeAZODk7QCVghRrvAs8AwKJB5L78eK6clyTHPLMR7/cdOAi6Ymwq1eUQpzF4x
	 6c4JJD/7/UFtjYD7svcb+ishxinK4FWZQGcTf2ng=
Date: Fri, 5 Jun 2026 17:16:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.1-rc7
Message-ID: <2026060542-chewer-decidable-23ef@gregkh>
References: <aiK8oEe-5pUc5s7Z@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiK8oEe-5pUc5s7Z@hovoldconsulting.com>

On Fri, Jun 05, 2026 at 02:10:08PM +0200, Johan Hovold wrote:
> The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:
> 
>   Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc7

Pulled and pushed out, thanks.

greg k-h
