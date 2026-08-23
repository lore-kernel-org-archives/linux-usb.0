Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF2218EBA
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787506055; cv=none; b=EEi7FhbOZPGlefQwavCbbaVMcDpNswkRHhGcrqfwuntCWMKOfw6k0CaJg5il8GgKLLKr+gltfGNmZzOzt5lKDXSEC+dUfM8Kaouh6342p9zI8lWyn3S2Mb6N3loSnCBWSQwz5+gY39DFnCnpqSZnGLkdOHQMEHpTcwz47dS327w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787506055; c=relaxed/simple;
	bh=5eWf8lAzF8CTEid0EcALRQyMt/9UE9f9Gv6NWyyVkE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzlqlupTqVBX1vK1jv+1lUJXLWkV7yexkiX0DDFCR+yaAqwlFtIkrOtdXFHkF/bgzpRXy5kUVVyQGflO/IAmxGeE83BJgndW2IZmoEE+d5lV7MwOnHpqE1hbKl5BWVHmEu/LsIanHKWldnEHca1CmG2yVdBZNgPCnbgAptzxXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1jxxglR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1jxxglR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408AC1F000E9;
	Sun, 23 Aug 2026 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787506053;
	bh=D73Q8yq5fB9gU9/4IaE8CHYYUr7DKIKzYAEg1zJXnWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1jxxglR/KKjLf5jrvcsHxsIPg4tD/FxuEJ82QLs3VHp3ar0V3W7t1gUopY7Q9wVUw
	 IDdWNm6h9B+KGgwvZ0+W5brCuYDt7Qr4FA6ThUv3VcbX+AS8+Zx+tLoPVFl0AJVUUc
	 37miHNPj6y54nFSzelZhdu5lVBBjBKpl1pR9pGjc=
Date: Sun, 23 Aug 2026 19:25:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: add tick_us module parameter for
Message-ID: <2026082355-turbojet-disfigure-29d7@gregkh>
References: <178750530003.146199.10916428504166445366@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178750530003.146199.10916428504166445366@yandex.ru>

On Sun, Aug 23, 2026 at 05:15:00PM -0000, Mikhail Zubenko wrote:
> From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
> Date: Sun, 23 Aug 2026 17:12:49 +0000
> Subject: [PATCH] usb: gadget: dummy_hcd: add tick_us module parameter for
>  timer-rate tuning

Why is this here?

thanks,

greg k-h
