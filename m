Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162861;
	b=UqChwvmEw9mEjk9ODRBhHQakpYitDzB5mkpKs+wlvuel2cD9KRC2NlVc1uf31uY/VDLP
	 HiE20/Lb5DVjdWePvSEEnYSunoDYOapZ8q4+jJCBp8XNg3rGR7xEKJKnhx1g3YNPsCqom
	 FKHz5QN46LHE6NauCTG67vy/0NO53+EsSiT3H2H79GAjRPXFtAalZgkGFCwDfRAYr158J
	 0IiZ11osqf8IooPLdvkKTEliVeyO6SKFh3DAfIVFWZQ9yE0N6DOy+sKVSftcbtR0IWtEn
	 KLLgszcbzHU3z6v9+lEe2VL7kSZ9qPaJtFapTLjqLI34QhXtKhoNJMHJ4Nip/CXC7ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162861;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u0jvlMXNX4lIA36M1+Gs5YWRG3HkQPTIzk5m9xONf5w=;
	b=tVkDEP22/y5S0rcEld3oROMYSHt414cwrS89n378pOG/8w86JV9DeKurIC+lY3Nfh/ow
	 VCUexWlM6GuSi/OcTDkD5O/PzT3lQofNdq/pQf5Ga7hkIzOiVxHda8ykYQMdxX+5G2rYy
	 b2EOIc4+fBymFAsZ3NwWqOQ14+zGlKIVPLmpYC06CPd071XZDvGrEeQSZQRf4FWg6yiDw
	 U1kSu1rjcCrNqkEjTyDOrvkWNZeYuU1KS7pb9xjaVr7oX7897uRQLVGjGYD6bzE2rN6/X
	 NyE01qm5rLhsXmnpHORhvJk82U1SuPtLQA7CyczZLbNWnK4nHkebczX5QTePYYEIASQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qlN3tgMy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEA2606A32A;
	Fri, 20 Nov 2026 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qlN3tgMy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4AF1F000C6;
	Fri, 20 Nov 2026 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795162861;
	bh=u0jvlMXNX4lIA36M1+Gs5YWRG3HkQPTIzk5m9xONf5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qlN3tgMyWT92MIF0hb2oPlaM+wVxJs8xZm4K44IZwywez4f6XWdAfvrv/aDomcjSU
	 JJ85uXXWlfgqBpOG1NAHc7lxqFaz4jnrrkQFyaEfMGmt2jc484s5hNfJ1fFKQOXiSY
	 r9bvY4O2e3PIQT+nvJx+c+V0WbN3Op+FK5K4NN28=
Date: Fri, 20 Nov 2026 09:20:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saad Varshani <varshanisaad@gmail.com>
Cc: nkapron@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: Re: [PATCH v6] usb: gadget: uvc: Fix deadlocks in uvcg_configfs
 attribute callbacks
Message-ID: <2026112038-imitate-drastic-8d6c@gregkh>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
 <20261107051544.4381-1-varshanisaad@gmail.com>
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
In-Reply-To: <20261107051544.4381-1-varshanisaad@gmail.com>

On Fri, Nov 06, 2026 at 09:15:44PM -0800, Saad Varshani wrote:
> Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
> Done this due to the deadlock caused by the mutex conflict in
> fs/configfs_write_iter. Validated commit with the C repro provided by
> syzbot. No other conficts observed.
> 
> Also removed the su_mutex in the other attribute extension functions.
> Such as uvcg_extension_b_control_size_store. This applies to all
> uvcg_configfs attribute store/show functions.
> 
> The deadlock was happening due to a circular mutex dependency between
> configfs (frag_sem) and uvcg_extension su_mutex. The reason it is safe
> to traverse item->ci_parent without su_mutex is because
> configfs_write_iter() calls flush_write_buffer() which calls the
> attribute function, holding frag_sem. Which prevents configfs_rmdir()
> from unlinking the item or its ci_parent hierarchy
> 
> Also reordered fmt->linked in uvcg_frame_b_frame_index_show() to be
> under the &opts->lock. As well as reorder refcnt in uvcg_color_matching
> store to be under &opts->lock.
> 
> Applied opts->lock mutex, to functions uvcg_format_allow_link(),
> uvcg_format_drop_link(), uvcg_uncompressed_make(), uvcg_mjpeg_make(),
> and uvcg_framebased_make() due to them also modifying
> color_match->refcnt, to avoid concurrency issues.
> 
> ---
> v6 changes:
> 	- Fix compiler errors introduced in v5, due to forgetting to
> 	  test compile, and add the required variables to the modified
> 	  functions.

That doesn't belong here, it belongs below:

> Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
> Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
> ---

Right here.

thanks,

greg k-h
