Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537A831327A
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111207; cv=none; b=KYG4r3pb/JAn1AtpoQTw5BH+nHMiix6FaQCSXGQQ3pdfhAmxCF8ovK37uDvkvHi9MrO5GswkJBAktufvDzb3nBuVGgmcZLpg6h4MVx4ES7oynlBjPmnBMCe0uFjTIkRwloHrd33RG0dXn92ui9tvjLIc+BbmlbDGuTa+ilcapHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111207; c=relaxed/simple;
	bh=qJFivaabp8KRIRXSwYcIOhVZjT8EmBnuMkWLE19YubY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG5IGCRyFDVrvqmDyZFG15KtwW4vvboBS89wvoWRd0TfuL6R6F5HY3VJ2KnTv/4ncy8t4/OgUtA4GiiUXKYphwc1xGgv/Aa+iWmexg/ggIK/SjzNA8SUWGZ+XkNXZ2Bpub8g3vma4MvpMLUU+FnVNxzFlTIfyjMs5dGcBQG/2Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WhpvpFhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WhpvpFhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9608F1F000E9;
	Fri,  7 Aug 2026 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786111202;
	bh=91sqYUdcLcsUyT8B35TiK6PSNW9WrZq7uLqJbin5PDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WhpvpFhbxORDseS/AhLdb5CSu/12oRZCW8YPiC7Ig+Tx1Sx7LqPX6bRDFhrOrFVS9
	 WE9L/0xwjHGOlCv86WGFrVA1bg51xQbeZUriga7e7JASZDERT0aNZrT5NoSvFVA++m
	 dS590aD6bek3dKzppTJDN1xX4Ll9alkdY4LVAA6k=
Date: Fri, 7 Aug 2026 15:59:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
Subject: Re: [PATCH] thunderbolt: verify PCI resource type and size in
 nhi_probe()
Message-ID: <2026080712-overdress-linked-0ec7@gregkh>
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
 <20260807113113.GO235112@black.igk.intel.com>
 <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
 <2026080747-doing-humongous-c14b@gregkh>
 <c6baa5a3-b466-46ad-a83b-f642ee85f04b@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6baa5a3-b466-46ad-a83b-f642ee85f04b@yandex.ru>

On Fri, Aug 07, 2026 at 04:27:09PM +0300, Dmitry Antipov wrote:
> On 8/7/26 4:11 PM, Greg Kroah-Hartman wrote:
> 
> > This is a debugging-only feature
> 
> AFAIK QEMU's vfio-pci uses this to bypass PCI devices to guests.

And it gets to keep the broken pieces that will happen when things go
wrong as it is explicitly saying "I know what I am doing!" yet it
doesn't :)
