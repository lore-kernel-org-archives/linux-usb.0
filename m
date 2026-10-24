Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827182;
	b=hmJG+Rd65bKsOA+79lcp0OfTnnhjw9LGAXH1EUkjJIjYd3MIwDv04u/8eLM74B4xBeT/
	 +0Np6tcNEm7LoDD6mTd6pVSviRbzQvYt987ZtfqpGZ8s4r6M85BoQERlf2VL4DOozAQI7
	 3q2WmvjwZHrO47T0uArNWvpq1NLg2fGklvOdMyfg1ykNceDoi3vf8qG7ezkbeO7ZTNKxs
	 8OUtCURpfRTWdQCnOP6iWwxfNqLSGlOz1MazD/9zR7nXkwXtX92gb9bOO9EhFongOz8YX
	 dwSPT3u7pHSQSd+HYrp9uFWvx1JxKEkrHj04WNvZ5HDNMI0AzeZLk5uraN52XnURLzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
	b=vkg4k7/vxo/5BTEtvga+Vug67/xl2yLvSsp4cmSgOFz2OFsFv/W6k8iQwkemnzcbABqV
	 bhvucgIub0Z2ZsDHJ6hLjbuzk4lgjqmmPF2+rD3xQJch1ojjfcx4/SeQQfVgPFnqVOkld
	 1MelgTbMjQztrIwjKyJFlbk+M8U7hK/g9xcAWI4zEvzw2yNqXae7fk62tU5KqD+l1E6VS
	 Wb92wsQEaGm4ATFsPy1dGg/q221JxQdWmJUYkQY0SduvebsFvSH+jdZGbOgSDpx7IUjyt
	 fQP1JB4DSGWCQzR4Lt1XJKqRvgI74YfduiWOayc46o+wzoKovVeB++0hCkGeGt8i6tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bIDYtbOn;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF52606A31E
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 07:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF52606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bIDYtbOn
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b042c0728so421247f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792827174; x=1793431974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
        b=bIDYtbOnPGADlrjGilR6HlFVpF/eIp31wIxr3wVKS/McxWVagsZZJcNMwIGOaDkaGh
         jPydXHn40ca3LBrlABACC/cWWoUxiiNQ6K37TuAZ9OwdOWByTtGVMcTPttbPs/rrEPpo
         lJ60v1+90zWJIUQbjPMADewT4OKMmnJWfpxYytolFHNH7DWkKldRUsZyWrhDofT7/PhB
         hnOIsKB4wTNr035cZj+SICgnq++LdGkxL98N7LJaydych2gY8QLXItAv1k93WeYHehTv
         Ds3pnjJrMgM8GsA9BuPW6XaI9nQwpsSBGPGmFcNOQnnUl7tbCIZ3e6bA8AfUd7KMXs7D
         IkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827174; x=1793431974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
        b=VyaFUEuQtygy54dJk+YFAKScqBG4eG4IIqFKlzRnshX8KkXzh8eUR4qHzSw74hwszL
         iEJT+JVcWF1/RnoiiMVnp290Bw9varwPb9MrhvJ1ERfFTXLFQ+4hkk0ff4L8XdLG9pZu
         lPOLdGzbkZrh2am5AF63qRyIyDAGBfzLqU757zpuexrDBOJifjahuLcYqdNN1IxRqq49
         /HN+aKOmaPsPEU78fYo+2pCehjOi7wFycaEuZAcRIvr2URmzMgZ1ZjUFUY8rHf7U1lIK
         nUXR46rixHK4Mm6oAYAYwPt434StKzXCk8X81QoQQeXaLLcZ6ZulKfbDjrnfkNskFsM0
         X1WA==
X-Forwarded-Encrypted: i=1; AKwUvBxC7a+93VQjFFL9qk9Qln0CJF6wkJlBh4kT223SeumkPZldasrRgsKAksaw4dQbLZJcUFRx7djHyzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9LeGbVdZLgG4HERYgAe97v6MAJ1y6qZ38aTEVpADNvkllQIUi
	Ez2xNqbqThJbCvTIn+yWjHWHF8X6ZSTfw2Qr9VFJTfFdcwClOMVbGLxVZMz0sqFbtd0=
X-Gm-Gg: AYBFou1wLBBokw3S/D8MDSOFqD898XG8TzQTrOzgNgJeDMnxel0uWaOCsiiT0+UxS2k
	cX4LcRLcaAWm9CWvhLMZrPG8wjLvGYe+tFT1H3Fh1OFK6c6yYMxtZFF7FXmH1+sl+V2zbKsDyY+
	e4ziKyuyWviNmZoZVdCLzYCu5UwZK4yvBEaGu//y5ZAqfkQlXCsxn1SmLSr9obAi6lWZSE2UXbt
	OO6v4tJvYzoLFuwMMslgpc3dX8Utk561ku8WUHdoWui5Q5oZrTlQMXBygNcVeY/lyWSnMcMJxX2
	WwWkjQLh1B97FGeL7ntqjaj27wahn1ftMakZlwpMvIqF4D2gr2pRQ+X99BMh8pxUFwg8IwTK9qy
	rQjOC94q8lBjecjFCwsZStX7fYEqlIePjQsWc2w0gzufYD/hK04fjwUEtm4y4lIoExK0x/Tr0ry
	X7deq9pUfY45+J6i21ZTShAGJlZBVPCPIkbd3iEXpAke6qBCQQEOlCTyC/OZb/qYK4RloNgNSr+
	3KO1d9wtOgNEkqULN8lN5n8RgOlDVdQMjAlcK8wORcv1x7wSNzV8BjLxhgdqhoHGU30RdmEn0WT
	hv2AMIDMHW/J1AM93BxX6qrkubPdC0I2s/U=
X-Received: by 2002:a05:6000:40e1:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e3eb9263fmr1987532f8f.26.1792827174053;
        Sat, 24 Oct 2026 00:32:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd35c2sm2752126f8f.39.2026.10.24.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:32:53 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:32:51 +0200
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
Message-ID: <atxdQ4vfh-b6GD0B@monoceros>
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
	protocol="application/pgp-signature"; boundary="snd5d5o342ief275"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--snd5d5o342ief275
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello Greg,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> We have real problems with random "bind/unbind" attempts that this taint
> is here to help resolve as it was creating hundreds of false-positive
> bug reports on developers all across the tree now that the fuzzers
> decided to think this was a valid action to take.  Without this taint,
> people were being forced to add hacks to all drivers for this which is
> not an acceptable solution.

Why is it false positive? IMHO unless it involves a driver_override it
is a bug to fix. So have you considered tainting on driver_override
instead of bind/unbind? You did, I'm sure because several peoplel voiced
that approach already, but unless I missed something, you didn't share
your thoughts about it yet.

https://lore.kernel.org/all/cover.1790612298.git.u.kleine-koenig@baylibre.com/
would be a suitable thread to share your opinion.

Best regards
Uwe

--snd5d5o342ief275
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrcXyAACgkQj4D7WH0S
/k6DIAf8DAU1k1OUjt0oOb7bxXYD1+h/zw0y3dtkGS8G+zRTS/qzzPPjfmqRP0h9
J5L7m6Y88ojmkEkaTuZykFHJjTD0oRB1HPOJTgCW6xGNMm2ZWeh0nTUKgD9H5GY7
w2HgqDafsFSbrwjrivGi8AGwp3WErwD0r+kOCr0MrPDA9d4RxztnKRXgDPP79VFz
52dVyEVot3hTvhqxMfO0yLVcwGhQaO5VnfAGO3zqb7oOJoL3MzMUVk3Qo8NuSz6R
zP04L1Pg9uTjUgCUKeKGGkzd/2+nMfGXjUGnId1rwsRI7WfBXP4t0r6JIOZsSNIY
RuU/lvGyyvYfTEwZjc1S5kWfcRrIdw==
=5xdK
-----END PGP SIGNATURE-----

--snd5d5o342ief275--
