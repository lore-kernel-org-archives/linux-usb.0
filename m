Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029236;
	b=uZZqJe7FM3sohTg2q8vqCGTZrRvSUElR0IH2fY3A1XbmeAu+UutdaPOOq4G/2hjF6jyx
	 h/ods4fS6cO0aKvSAuTSuIE8UEQu+hXH9bCgUJTUu86n1/37cl7FNfzcQ8CosJ49xg6KG
	 BIYhzIVDHXyvq8kIZ7Ws+F/VkehRGqNGEav1695ySWIW68E20ls2o1YORwA8aMrYhMyq6
	 HN34o16hkzLhEtKlSWEzd7HUeZs/ITouU9+aOfdJwrVJsiNDI2BlfOtbFIAOhe7I6JEek
	 nP0FCOoJlvNAQ/MoSxSP6XM9rpNoqH1buKLGhaNj6pH8JEJQuL/s3qUNFef/VT3BGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029236;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8tdRJtazbCw7hehXLqbY43vrMBYt2zFx+6lRRKVfEpw=;
	b=IEqOObAwEta/r6NtPIo/cZcaFVwfH95GvZEUGOVK3zAC0eWj3EXQJv64CR7jB+nErj/4
	 Tagp2oQq0p5F4u++btXz5f2TTWgf6sB6HVif5wACdOXS8EleYwRqhkrW4PET9rolN07tL
	 PFIniVZarN433Ya7O3k1Q1Kv6GLEUqcB1N6Mnpor8ZBMrs8+vnDz+8vh/csINkBzpVUgY
	 GDb6oDweZwerF3AuPyK6dn7nAiz8I05Ez0Xpx5H3xq+92HAlbk/7TmyMQQ+RlTUMarpl2
	 CO5p1JwuG71wDQjLj2UZe/BnRvW7EMEmjeMN6lsZI3TuZtrWSZnnBo0bd6uxgFtdfQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z+PTtz/q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC9606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 05:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+PTtz/q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFEC1F0089F;
	Sat,  7 Nov 2026 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794029235;
	bh=8tdRJtazbCw7hehXLqbY43vrMBYt2zFx+6lRRKVfEpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z+PTtz/qEHBBBc8vVKk5e2alroWKIqh483f6anPXz9Wm+hhc4H1SVDYXhZy7m0lg/
	 1bK8IH8ZMjWZQWlcerTh0kej3DHfS6DWwgoRjqWv6+E3NqoVyrRXLrJhrkEoo0pFhc
	 XT9j7DUFfKp/EdEj5Kpcmiw6VcYDho5GphmjJwQOlcFk0domQtVRUcALSPM98K9Um+
	 AQq1ns/uDvvTfkbVUQGsav0l0uxeCSah3ESTcooUxRwmQRPzGgOb7w8u/Ib4/zooSA
	 5uZEE8CPqu/9KLvSgmwfcSY0/Y06lomAF4WNal2+gVl8kUGeeezbFZM5YWKmcOPgUG
	 7yWaC/ZQHj3Pg==
Message-ID: <sashiko-outbox-202616@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] usb: gadget: uvc: Fix deadlocks in uvcg_configfs
 attribute callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saad Varshani" <varshanisaad@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107051544.4381-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
 <20261107051544.4381-1-varshanisaad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 05:27:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: gadget: uvc: missing Fixes trailer for su_mutex deadlock
  fix
--

commit aca7deea58b6e580c30b8b5a2d20ca884047e359
Author: Saad Varshani <varshanisaad@gmail.com>

> usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
>
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

[Severity: Low]
Since this fixes the su_mutex deadlock in the UVC configfs attribute
callbacks, should it include a Fixes: tag for the commit that introduced
that locking?

  Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107051544.4381=
-1-varshanisaad@gmail.com?part=3D1
