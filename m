Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169833;
	b=L9f7h/8hZMcT2yFdwZmIRJECJ9ht9iQFQ0l5LFJEmQBhzXqmKF3PUtXRY1m0az46lXiA
	 /VqXT4x3NnJ8MAlzXjg3jSTjTJsZSm6m46qNnXsljgktenl6L8LAMqfnJkwT6DltNzHeN
	 qNZzJHuQmFG5Z7p4L1Q4JdryDppIX0QNfE8nbxn7ZhzDV4knE1s+eNblAXaPgeZeeauhJ
	 AH8kOjdpxaAAjYDpxVnpE/G4di9+BmDkV2XE3kgrJT27k3U/hM2Uml1wlLZpuJX/UZeu9
	 B2KkbfqHsA8fPk/mmp8IE+CZsIhvf8rxo8V8QvJOvZ1CltB9oeVxjUyHn5sijcGelDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=69s1YvNwHvg8EYB2zz5IMp86+yWpKaW4CD0ftVZTYoM=;
	b=nkvPLqqWGr1qXyDYww8QK88PD5OPuwIDJqtkxOzr0H8tMtdeLbF7djaJUKFQWaIMXKvg
	 MX3O4Hv2xB44614wQ93A26UIFcKWNlCZRNbUaX0JdQnq3IzG0xp9zaV5bIroP7sym6HGn
	 iCNlsCSi9wFzu0QAE+cONi2azh53zOgqXLXRZQWDHvivGrsMaLNi4d+PsOcvNq/Qip2aK
	 mj+9P7C+DYtAokMRNVoy7Bxc9CMsf4npjxExyImOzfqFNUVE+/uHgKl8kirV4Jp6gZFHN
	 3wu2PODooYAeCyaCEiyRc2geznkjeGZxhjA6qS4nWL6QHt3esdHW5sd7FMFD65Ul19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q7rnfqgV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DFD60A2619;
	Fri, 20 Nov 2026 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q7rnfqgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B241F000CA;
	Fri, 20 Nov 2026 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795169833;
	bh=69s1YvNwHvg8EYB2zz5IMp86+yWpKaW4CD0ftVZTYoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q7rnfqgVgJc/laXh6yYvIqMcFYH90pjwgv9t1eZ/EUlpY9X4+LNZ8PfW06pG1eo6P
	 SDfXdMqq85C5f0hPoNh9nbROgKjZBtahTcuEkJkSKr+P7D+6MqC1pxUDcSckzpznRh
	 nh5jut91i46pj4BSmy0UxI7BopJDVA85fziI+QTQ=
Date: Fri, 20 Nov 2026 11:17:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free on umount
Message-ID: <2026112056-amplifier-opacity-564c@gregkh>
References: <20261008003955.1191-1-hackerowskiy@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008003955.1191-1-hackerowskiy@gmail.com>

On Thu, Oct 08, 2026 at 02:39:55AM +0200, Eduard Zateev wrote:
> ffs_free_inst() releases a device and drops ffs_dev_lock before it
> removes and frees the device. A concurrent FunctionFS mount can find
> the released device in that window, attach a new ffs_data to it, and
> then use the freed device from ffs_closed() during unmount.
> 
> Keep ffs_dev_lock held across release and free so a new mount cannot
> attach to a device being torn down. In ffs_data_put(), read
> ffs->private_data only after acquiring the same lock, since a concurrent
> ffs_free_inst() may clear and free the referenced device while the
> putter waits for the lock.
> 
> Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver data cross-references")
> 
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> 
> Link: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0

No blank lines between these different tags, right?

thanks,

greg k-h
