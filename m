Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245E2BFC85;
	Sun, 16 Aug 2026 04:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856376; cv=none; b=kEVZ1eXi8S9NaVyYYR+oX84ZsEemzeY2pU66uWR78XYi1cvjn8MADr3/LQszC4qssFVFCb0W7sXvGlNHX1F7NkKhnwOCdULkb+K/MUQaROr77Mg9yId8tfvuCRZ0s0JIPz7ovyJ0Ty89nipP5+OgJz2xSLjdChjFrKa9erup1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856376; c=relaxed/simple;
	bh=Qx9saWbhpRX8Fw/TXb4ati7DIPmWjFMvznUjOmzFs0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFbuPx6axi+DQluBfOO+dUdU9Cv+H6OMlEOujgyJ1vR41ggzWukwz0xLh2YxycwgG7eBTYwPF+ANWplHrtNxYkNl+hrZEv1VVwi4n9geP4cxOV73Sq+v3+FYFm4OfnwepjhCvXeu4OJUQaIQiL3b8FdKUbh11f8+QVzp8O+6dAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p65qJdVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p65qJdVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF16E1F000E9;
	Sun, 16 Aug 2026 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786856374;
	bh=nOuYsGg+zB8yZV7Zu+VqJI/GPJ/YJt4+9LsF5VCLRtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p65qJdVU6XAaDdEk4BSIP9aFjuKz2LXCa43k+FoEz8VGH0yPKHxYOfithljb7Vd1L
	 kFp5q44EfTJEp2X+CcetS67eZX0xhffoTe1wLHTJesXo09bgj+6A5DLTqDkK2/+06w
	 +VuMwIATZ3jouYlCmKi8QALrEo8d2F0IBr3yBnMM=
Date: Sun, 16 Aug 2026 06:57:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Colapietro <jasoncola1@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org,
	skhan@linuxfoundation.org, i@zenithal.me, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usbip: make remote list honor parsable output
Message-ID: <2026081638-gush-preschool-590c@gregkh>
References: <CA+Z0x2+Ww=d=4KJYBD_0Zg1xZgCqoZh=_7H4Vk8e-wusiMQnsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Z0x2+Ww=d=4KJYBD_0Zg1xZgCqoZh=_7H4Vk8e-wusiMQnsQ@mail.gmail.com>

On Sat, Aug 15, 2026 at 09:31:08PM -0500, Jason Colapietro wrote:
> The -p option only affects local devices and gadgets. Remote lists
> still print their human-readable headings and details, so scripts
> cannot parse them using the documented option.
> 
> Use one file-scope flag for the list command and honor it in the remote
> listing path. Emit the same busid and usbid record used for local
> devices while continuing to consume every interface record from the
> server.
> 
> Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> Closes:
> https://www.google.com/url?q=https://bugzilla.kernel.org/show_bug.cgi?id%3D219502&source=gmail&ust=1786933867960000&sa=E

Please don't send html patches, it breaks the formatting :(
