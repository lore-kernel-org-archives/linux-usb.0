Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3040B6FC
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571398; cv=pass; b=ECHnBygXkx5IFsPyI+0UFhrYbOkMaQW8M8eV2sASrktGPln+g8sBhowKPnw4kaW48038Y903+ovzGT+3uYCJoxjwjADlk2/yTLnCp8aKQGdaVz/PhcBSon/SEUKiv93de8x2sn0tNplo8J5/ujP+MTj68dp+gSGQIJkB5CfBqRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571398; c=relaxed/simple;
	bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T01Wj1Fd+gSGubz3WlKxMMwx41I7+tI/fQAPzhpD6zIq7HTaU33lJHAp3jSvtH0rDeHonFAsbZsOZvv/t41BJrBwCmcw0EFfaIO231CqIY9ob291sZ5c5jHidbWMi0tcqOG6NhKF5wIZBG5iaxl4MDYQTV17cf4UDgL1gWF0U7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFt7WRk9; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFt7WRk9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so2261535ad.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 04:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787571396; cv=none;
        d=google.com; s=arc-20260327;
        b=Rt2HkBjfidVPlrDUobGw6dWMk4/k2CTMGBL6wiIscY8kZzjcED5SdRTwLqzQpNuE3y
         ZaWKOP6LKbqFG7whk6DcNeBJOoNJMxy7/N1RBkgsW/ityWU3scT1dLREnjyhRT1QJwSg
         nlYXczqW65X1tRHhQ44CMu9U/DI3p7t5UXsh5dlMEJrAhGwz3euP8B9AIZcrv3NkkJAQ
         +8qesRvpLFNyHJPI8p8zPZIGjyyMfqF+K0wFR7JzqDPCB6Aynqt1AdT0ARC6HPKqA30G
         geC5ZMvnPLFqVhbAaqmCCljfkmK/ILTMBcCahkBRmhhKQrVLiemB/gBYa5fnau5UzHUT
         62CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        fh=q/aYiZ8VNy9IuTgJtBmgOy2Vnjqr0hXuQRw2SHNVUn0=;
        b=O3sYWJTLRhWMw36RXEFIQX2KeQflX4UbR4imYDGeqRO2BR/c2u26YfbnX+u/KdvOQM
         RArr7ON4sbth5XRemnrafHZjODILxqEAgBp2Tjqi+IpKb+m1pX0RpiO4RPTfO8Hwhw1d
         IP3jtB77XS7kz1o/uDD+ZKhpLNnvYaggWa9UQ7Mz1Sh0ydmA1s4Cim2nHAddmPKyT0Ol
         7zr7EXyQqIhifgLv6NVl2b4qdDitLzf/qmdrHSnfTBkWZvrLGJ2EtjuGBGUH06q+s/A6
         E/Riy4VfD3QWwwnRP/KwsI4aPA8qMwXSKsXFFsCzb34106DH1FTefIfG/X8cQAZf/2C6
         k2AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787571396; x=1788176196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        b=YFt7WRk9Nw5n+i/byMsiEaa4pUCFMwIOshTiaBYfmARkFAcX/qqf8idooFji7JpJ4V
         8I34V5VPE/KG8FVWrMOwRcHp0UY7rjPa7LnUR+B2rG5woJ3E9vuC/Eh2yg/2usdoBvp/
         sgDBOYdtWrBqrUWgwPwBFa0oDvKfFJLzefi2in5uq4x8w4fS8H4cBSKU8F9Y2M+WR8RF
         QkcAvfYl7OjkWvMO/Tb3tcOzaneE014I+i3hMlZOBVF9dLsLPSrerORIU6H1VrLq3Jh1
         krdI/j7GbiJT+hC7CSjdD2Uv42ryCAzdRaCZFoOZqJ9FlvCJBlxcPbPAHtRNv4k09cv3
         hG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571396; x=1788176196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        b=Ab/FfqzZywU3v1USwdOGbrMMiNu0COTmMjIaGXXPCesHOdOTN/WDhgYdNs6mW28Z63
         voh1bLQ4WBwrYSWM2ZEwVlqI4ft/fNeEYwYx9p7ZCJknmyuhuLGBaCLmzKo9CEWxWYwI
         IyuNBi0S1e75rBV7Rj+mENBzNwSlIQ/T3JigSFtBGL2U6NDWW6IwMlk+ghlgNnp5Tjgf
         IqqyeZzm0hlrPb4uHS1dsg3spsUDwxejx3rIzllKKforW9TbcnQYhZwa3i3Cu5lvqE7a
         setxCyAG7XlqM8SvEBfKc8vDQmpKaorFMGon3fE6s7RzD2Ec6EhB27BnbW66dO+xrsbS
         aZMQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3czxiDjJJ5MHEgykkj/iTMkQjTRSIpDalguE/gbtcY6U5M4zSYIOD1vtqmnwCXmAzQDbrh0256OU=@vger.kernel.org
X-Gm-Message-State: AFuF++mN4ANm+gtrXfhRei0gLnnCggTJMulwIKgKkWCSF++P3RN7iX2M
	t4mFOVGwlZhqalmDiFPKa5nVtyuqPbuIXLr5E6BLAb4YeQlPaYPLyxIu7giVDlfu612VmSEpX1o
	JDMNrmB5HRlJcNJgb0iAMqwOhEkDKYPo=
X-Gm-Gg: AR+sD12UAAe1zfOMxMZpeJktm9bb5mcRDBu7Xdb2qOcghVw9/WB4hwzLXiRE+ZzQY/q
	ScHLfRhmzniRgXU1F1KPUfovQR179IjhFWFYGtNpmmmCIodscibVFTRDPFOR8+vu1Q1hYLhNg+f
	ym+kWGCC1tsea0lB1IXa1pKVvs9L3lacdqOmW0x1FbHHnTh++BSXsHUgNy0m3q6aT1VS9fHiMSi
	midy2eyLJ7EZZGumj7qz7w2QJ7ZqiyTVyYafWIM8zMFyStyeDS3Z/60cJSA74wOq3mmXuOQmVDL
	udd/fpngfaL4JmwwkmtdM4fSi6PjqcZN/iqi/d+q2dCBZAGBOYRNovLftfVQzOrNT9RsGDTwzk6
	roeaV+F76lEYHI0ePMo07JFlKOAzF/kcArxdlP8RmNWIBMwaDU8ELuEiaOd0qQLQ9TgQtS/w=
X-Received: by 2002:a17:902:fc4d:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d64a9a668bmr222250785ad.0.1787571396025; Mon, 24 Aug 2026
 04:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org> <20260824-unique-ref-v20-6-490735672187@kernel.org>
In-Reply-To: <20260824-unique-ref-v20-6-490735672187@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 13:36:22 +0200
X-Gm-Features: AcwNN1XvVB-Mna-bMRr_-WAakhrdmhTEWRag6uYdZi5jKauuC-nwA9j0nxkTDxw
Message-ID: <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
Subject: Re: [PATCH v20 6/8] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 1:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Please see/link https://github.com/Rust-for-Linux/linux/issues/351.

Thanks!

Cheers,
Miguel
