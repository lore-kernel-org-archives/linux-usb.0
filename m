Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3F36E47E
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641352; cv=pass; b=ctUT8NzMQTCP6c25hTs6ozFLcxKO5Ht7ILbbS4FXukyQa+CL2lJfHflWJaQUEmnEJ2YSabTni5frhTTS396MDxj+1AbwiA3Y7URQxd7gDoa8YA99HSjxwK/xNcqYB06oaIlcVqgHVNO079Bvm4Oqv+3Bw/l4suKleyY4NFMflgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641352; c=relaxed/simple;
	bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BY6VgEM2l6oGHH3Shkk1cxvJdnGW/DuidS3EePgMfddDtNIlblWgbTbgI89YAaTg2ureBbiXTpuUChKPgijWO2jype0BAlPRJ+jObLWsVaVEpEFGR/dRh9OEPoDu/amOE06EdrQ2f21fGb8MgKE9GeBM1YTYn/V7BoSrWCc0WBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2s3Wz1N; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2s3Wz1N"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30e869ebc19so44063eec.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 03:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782641349; cv=none;
        d=google.com; s=arc-20260327;
        b=Oq4mGmmEfqlpYj/EdCstF9WDR7GGiZbV4vXh3iVZRql5SmwSPWSJXyJmy2YqKae5RX
         sRRxl34yk9GSX9Z1+DGp/ax7HrkgfXpGPskN9Q8Qh/FEFbyA8d0mylV0yA4p43CuQbgh
         Xdk8gYak8dTEWKcgXpeLCZVn0ZlJdIZxVLY+kDo2yHx+L8mB/si2nJEYXr2ppySNPRdI
         RQBDjFI4etEWrOFWZxa1LxWzPYI0ow/xi9jCIQREm0ZnzdNMzw0HKYQEYKc80duUcnYN
         gQHtFYf42AltweogGExK7ktHgetkIGnjxwgs4WJeul3XlL8ISl3/+y+byXxHJKGdqWuQ
         YumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        fh=m5ubJlpJJnxf2gzHc8jzRK/R7z+pnu6uYrnS965MEyc=;
        b=o9xZplK9A/2kd5cvQ4ofIiV3zpcDpJXcQBXHdHcEqmOUXkkn5Q4a+dDpr7ifdWzcpX
         SHSUk3yw7cwi7HQSST539YWH6iOP6y3TRnAkYoIkxGGSwF3iJ8aTtversVgAKTSDLPSP
         DM5YWmTgU/SIuGUy50IVWspe4Mq3eoH7vwQBMCaOo31YytFS220V/L2MxDcfcvC+X+9V
         DKF0l6yX6MVGfHcoAMeWrDZX3bvq1jotQeY9cVKrJ2lr1Jx/ykzq95J7va4tUT5YRzVt
         CRwzdNDD3kIxT8D+yTI6DDDgg2MLBBw181DZAfuKNj2hd7rjlwEKFoUTzz2F9BbJR5AE
         lk3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641349; x=1783246149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        b=j2s3Wz1NL9n4BfxFbs8a9ybTUnzD/ufHtK0KWIUQWC7iZryQCM8kvegBMNn16U3w5w
         OhjiM1fUxfbnu5+OWMRJPsBoOD9RoTwhYDBri9nhOOy5facyc4zDqjWj8YN8h8L6BVKG
         MiUas3cgpb6zNkY1DQBzyV7WhZt9wb+7TZO+Z/S5qnN0cAGLAQlZSkEXndVWFg0bl/QA
         ShKPU2DrbNSLEEmzgCn+SJOTg496JOumXqJ5+MjixbZYrBNReqg2/lvtNbQ9pqym9rdP
         sCSrlTTSGGx+ahy282jwmasPq0kx6/onhdXUdUos9UMhxI38syCf/Ji1+FNVcyJIRNRy
         aStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641349; x=1783246149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH55ZDErGBusi1y6rzbbTwumKhX8mVGmqH/AIM3YLpI=;
        b=U6IIzVVyfXKBj8Rc+dI30ZqciZTRFMc8cQ6WIiMB0pFoxFVzw6nwc0z7xev+18BKsr
         7wi/c/eu5U3DR+RGyyJcHfWI4hwVnN9aIsUAmAOMQYETcEU7Uql8qehCVRXcu+zeA3WE
         14/7FTI8NXquidV6xYIR/ojxql/7cogvCzLu7bTt9p5RrQlpElftP3/UvILz92vonai5
         p/UhbmWeQt1Svn6ljYKJWbHtQh+HhMqx/YRCAAEevKjOF3E7WKHXhya8/JOjNu99oEr8
         ivzgS6vCs26Nojp7uZQm1R+CRDADt1MDH8lPTsDBTSTLDYdKGMuneK2+bJlYh1Ky2Y+N
         FjAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZ31YdGMs3twhEeVv7eLuOSWcOEQyfYklVtlNm66XwFGMssgPUoelyQnQF2ejYNvx4DxhXB373pqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk37/a5b7x2g020pZ7s+MNWyJXIX2KxSNFlLCzaZWLg2MSJKxZ
	cHmdqOegUln7ky/LLm0BXQktCzroe141MKzd8H/30mNak10e+lFSnPfii9sdqjtHZqjSGuboS1M
	ck3GSApXjhutcwpBIx7iCQnKBJ/HNWj4=
X-Gm-Gg: AfdE7cldCtxDgUN+ciKQGWm4iCqhAwvFH4iN9DwIQAUaSl8btmKGrWUk2vpKSZ3omZy
	I+ljQR2f8BxqcEobGTMDV+3o5Xalsu8LDXE/NYqv+gchIl18hYFGxcZNWeF+079Nwre23eEag6o
	jwzadSVv43sMIBd+wQenD40giqSj0qeNNUhTIVg6xkoFlo/ermfys6B9qXw0pf3f7TG/2UdmH3D
	hFOyhzE2cyDKv1991gw+qMWWTtLNU7an1LKP5idMyV/53QoHqI83SxiVJmkhq4gbex4rF5D2Sg6
	oPKAKj6BDt2/zROwfXgQgcKvZFYJS6/msXP7KqDg+q9bR8vALVmyAGhAX/gtXSjDmbM/y1teEdw
	d+C1sdMNqbCsI
X-Received: by 2002:a05:7300:8609:b0:30c:b42d:47d4 with SMTP id
 5a478bee46e88-30cb42d4aa6mr2725415eec.3.1782641348716; Sun, 28 Jun 2026
 03:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625224927.404258-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260625224927.404258-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:08:56 +0200
X-Gm-Features: AVVi8Cfb_v-G46exRFY3-4t9C9_BwKpZ6hE6o2xuD9yPTXeLyP3R3mkBDkoASc8
Message-ID: <CANiq72mx1EDo4EYLUMN63_MtScJjobbPH3QCZ50oJCnZ9vc27g@mail.gmail.com>
Subject: Re: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id initialization
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 12:50=E2=80=AFAM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `usb_device_id` initialization instead
> of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.
>
> This change improves readability and removes unnecessary unsafe blocks.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Looks fine -- if needed I can pick it up via `rust-next`.

Thanks!

Cheers,
Miguel
