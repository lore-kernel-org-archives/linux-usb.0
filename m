Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932496;
	b=IHq5Xmpj517pEyoMjH6ydk7VIvft1tgTwMmIdZ+fPw/8uaTEAnpPAhz/Er5+N0+Mho0l
	 S1QlmPRToUmm7JTiv7l2GA6zhamIEEliRRYY/vsyQoJMVfjtfixSjqTGpcK69g2znkrZd
	 TqzsSXoIYVWw0fgLJVLrPxyzHmXAbjw8lCkWf9jk8tUDzBFot1ap1aVVXQHQLWyvrekft
	 /iHf/Lk7R1lwO9APZWhpCc+efeimnnsQSiW7oitIuVSVFpNSWKYIndksSbOPYqDr2quqb
	 V7CtRHTS4tuSz/hJESE6FK9u68bY9G61jp/o3Gr6AmcyEOQaYzx+n8TRjdTimbX1OOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
	b=48GqLeEukX9MqCxVDarVZpzIa0NGv+xvvo+NNajxQ//IuFNKosL8O5OHETIOVE3leHdg
	 uoA02zGa3RDrEP1XitgCTNiS7f89YrDS1ADySxhanjs6/nGKWRyDTzguoBnp67+Kyg+lD
	 tl/yyF8rTA6kxqFlP2/Hz8/QRDa06OQEEXgXCCmuzZx7GGi6P8BU1O2xrrKKKVT9PYuhb
	 aOIAPgt9795p0qbYKb5V42TkPwcuwqeQePk0XqHkdiwQDjy0crmTNM9sYQjoSVXN8rT45
	 xFeQqxEUxd2b8CPq/Zin/KvKUSEfgdXX+EntGI5nxiFb5SGtSIcwaEC8lJUqYPbsecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37213606A31E
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 12:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37213606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22329875e9.3
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792932488; x=1793537288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=pg8FDG9OpzKln8+QRdvhMAtMVp0WQ1NMYaLASyxAEYJWLNST/WK5rNIhMJud+ol1qL
         fnBQe5FIbncQ9e7Yf2jY5Avm2y32XlQwi8zLdEdscaiuJNlhCMoPO1s4R86eAMZm65+N
         4wN667A/guovDHJDdgGvxXS+E40NfJnWTsV/VNIYrlv42LuwoD8jhjPqOl8WFcqIB9pB
         a1e9nczTgOPdUb4RwVqkaM30MzLLvdbX8vRjHV0JGK6vlZjszCVuRfZPWEEEj2bVwOtS
         Onb1sPkJ2qFK+BNjMAVgcE1OO2VGj/K5/NoSG134pZJDNd8mh6bvz+WE17qQMRc8Utq5
         4GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932488; x=1793537288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=tXO0WBCY22kt1NxDaG2wxSx+W8Sh259FLqbM83Ua84H87YHMLKHdHfL8wGn+3uha1G
         lA/mNu7sQT2KP1Tb+voYc6dlByeKN2Nh1y0695weXAVsPRzlg85IbR8llKMzFESznTnw
         9wAT4eSL+VLafDN1Y/0N9YmtEwfWSpvPxQSoKxN2B/6sCxX3ttJp4lgenXyLIgSZ5Uu4
         qraZATifOAARj23HwaEE33iIV/qd36acmDL4LTquumXBLEhxYi0DURTQpNuO6iKK9+sH
         09NMogo7z2NJHfpf7xIIztYqtP9S8RQdajzperp4Yj/luTECGvZpFa7nswjonRX/7i2s
         Dn7A==
X-Forwarded-Encrypted: i=1; AKwUvByc59WQMKV8v5SaHHnzXtuOvPXvf1ahTXiz9PSL2ZmtpIBzW+hxNlYlfrAIEt/5XDY1acVkUH09uAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1YNTG27IrYA3WE4Jp0TKbEzhHopj5WYHa4yxWu2xdq/DXS9Pl
	HObh0XB2frqU7zm1vt2GUVWxTvag3ao/m8L5uHhaT5FjuSLEJ5sZjbvtqH2nnTj0DtA=
X-Gm-Gg: AYBFou076EHEIimpa3SLSnZgLK2KGvUqXCg7p3HeDeb3L4x6iLyRNL1lpq2UyKbLB3k
	uUxyW6Xs4t+WlcEwMgYyfofwnFCUyLD5ayuBGpPkn5NZ/PPG3Y43xDM5Z8L0EuB3NMkJ+xnBmlw
	tUEzg899q53AYCe6TU2D4RHSmzjn3ndQAu9oLwggxL83ww05Whme/T7H0d+W3gDFR9ERZqjmqZF
	0/u3jglFTV3Yz4Tf4UBzD9aB4ck5u9toPQn0XblbTV/CE4d7pq090vR4+bZxv/WhF30QsNJIoQe
	FNm8V3d6f+KMEnZW6pkpVXdHS8crO7srMrtNYEeLlXXa0Y/WcUdPP43TnYIa7CRloWv1B+4WqGV
	ZCZGAoAwTeEC+6bvDkHFC15dGHL893P/x+4nIF9bDS3/OFBlA0pkWdMs/ju7wbuKD1kTtCXo5xH
	jeaVq3yOxWA5ZTLPhk5Gl9JvzykzJ+HFB6SJ8jE/x6ReSrKuXt2gH6WplgM1V6T/VXh8uxGfXUL
	aypTjM5RWRsYbGVmtUJcuhyGOUpVSqzMKsuzxgYZ4u4zLUWLsk8CpGbl61q2gFg+aDvS2RdkSG+
	th0mEw==
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr71714575e9.18.1792932488137;
        Sun, 25 Oct 2026 05:48:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a04ad39sm326937255e9.1.2026.10.25.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:48:06 -0700 (PDT)
Date: Sun, 25 Oct 2026 13:48:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>, 
	David Lechner <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Thierry Reding <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <at34UOuYv3NtX36R@monoceros>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hexcezj4rledtjd3"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--hexcezj4rledtjd3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> So what is the real use case here, taking any type of any device and
> thinking you can bind a random kernel driver to it and it will work ok?
> You all have specific platform and pci vfio drivers, why not use the
> proper device ids there instead, or better yet, bake-in this type of
> functionality into the bus-specific logic so that you can have generic
> userspace control of a device (like usbfs and uio does today)?

Also note that even if the platform and pci busses implement
bus-specific code to pass a given device to userspace and/or a VM, you
need proper unbind support in the driver currently managing the device
(or cripple the mechanism to only work for devices that were not bound
to a host driver before).

The more I think about this taint, the more I believe the commit should
be reverted and replaced by a some stop gaps for driver_override. (Be it
a taint or better yet
https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com/
.)

Best regards
Uwe

--hexcezj4rledtjd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrd+oIACgkQj4D7WH0S
/k6aewf/a1J79AfBUwvrOd6Ba/0Y7Snc6nW1R3bcrJe5+V181tlQ+NubUnz+DJdu
l8Jqw1xcQaALmyYYZ+CaEenSacHj9TFNREGi92ZjNkN8m6+iH5soIV1vTHPZaevX
R9oV4vf5RnsRXugZv92lNktCGbzbu2ceTDhJU4IoX5FyuqL95AVajJ4awrTw+nol
Y+gyqcgb8mzONrS7D52rBINMIjpn9/nmcPs4bVkXCZjAvPg+MFRZTpjwZ7hB3Guo
GM19dH/Q7rfMakDFZ/TJqgDbxuKHrPdU/EFkrRXiolTo+VEKvUOmiiW/JK6zrFH9
WNnJHHFnJdcfBwsazk9IIqGimnpBHQ==
=zFX2
-----END PGP SIGNATURE-----

--hexcezj4rledtjd3--
