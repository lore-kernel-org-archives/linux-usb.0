Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC74AF9FF
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442153; cv=pass; b=Mb+OjDlhA5AlT9SgYvrp5D9wHxVFgIDW5tcU6wCQDfGvsFj6MhLYg+MKnAswFTdzsjhiSJOmI9GOwnqzTAvsV216MwtDiVKHEVowfhOQAfhgzKv96k6ALoT9sUzclyMGWdfIxeihh0hc2h0IMFnJi2XhYI3lbGw69cJOh3YNgBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442153; c=relaxed/simple;
	bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oY8GDPWyrajQ2PsCwws1ONwjGb2rud8e9RvnYeLSwOlTp2FJ7OpgsHckcHaCaTffl+EpUC4aDkrijWb07vE8nEiwxAXFrYqnYOq111dQMreaDMmT3UMnWKob5THebKjLLF0Qlr3w++Ng/+5VccWdk6XH8mLJRWZ44Y+sx6+YLpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QibOJQnk; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QibOJQnk"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e4efb18c9so319364b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 06:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788442137; cv=none;
        d=google.com; s=arc-20260327;
        b=oWSZ2drEgFabkbWuX/kxfgKnbKkb+XwvXTyEgYn7lVAPEWp0AcdYu0qFrwTLPnfcNf
         aG/KqAE7YLfa9hrPPGnMAe9fvTFmeMdy/+qn7x4ZNmMIp86M7sRYm2oEEPTwZaktPo8z
         SAHBXnqD33jvCfNeXCEBttkGyf++/VA2DF17Cg9iWVOPgwIPNgwIC7dVhAzQ0qN9iUYC
         Bn46iiWwElq+Q1SfW9Rt9QZmj4UvhbGnH7iHkRo+B9DV3J+XssjClYKHxTX0VC7eb4G8
         1EZ7VxOWJ50SX/BbS//65jL0lmoRBS1ac4V+An3OjnU+Awg6s/Wwqm26HUXJHWZhb0n/
         lgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        fh=sEnPzGL6LTheosc46gej7WJtsiw1dbTOLoljI9h5HJ8=;
        b=MM1+fGTPTDkHN2OoSOjhUojcki6Lb0xF+GlNAGtodOgxYBEl6/HCe8VYC0BCqQOBEz
         P04R+BQL205fMGRcOLKXZaQNTdo/6dLLu78ZrQbX+55YdDcuped8jVHIpW8uq4it4IxE
         HEP8TZtjyjXvOBPtFVhBEC1jrzTFRPJ+B/pYIGVGrBNGkdmUHVCTVk3cQXFP8/pT5z/A
         yEACwiZ1ldNbl5KdPbpl9tJgUiCF51s07HfmtwWvgx85KKSiHfyxKPSCjuoNM3iIDlJ1
         BmazeXr3cWvAbMYQA5ZLTISi7QURMw4ULhXmu3YWU13E3NBb3eWqzXH1HOoSJ15yodsK
         JGSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442137; x=1789046937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=QibOJQnk1IcJqAPts7niHKXB4MYd7rKKk/wudeEGKQp0iGQwDGwevv3JskZ75xdch6
         jfqm4L1dCpknWVRfoup0pgPVeoVkxrEgPBofP5UlvVojRvaPkpNXhQFo3YOpI5eUKzJ3
         oVIpCzNOrezqt2zVbyS0+jWle3e6IbhPsEo3ji4QqZhQGS8vqm75osJq5KNHbniSe7Cs
         7IMjXLKRAKNvoWjZP6f0QpU7q5nxhdS5rzzAAq7Cy/eRo92sBJSuU2C/89sY38/jJfVI
         jvANMBPDBxnLupAoA5f1OGYcmYjS1lAQ1aXvNLhVjMv0fKwt2U1nwuAN5oFlZ7SxOXAL
         4HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442137; x=1789046937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=BcrAosfUe5MExGNY1RvyPDXoF9s/qVzEcW8FSiwvculZGu3pY+Gq8dVRzJXz389GRq
         4q0W+y8Ib24J9ExWtH00+5F3wHXOEdup1GyHFqv1pF1nggbBGmB5d7PFfnZ8wlKWe4nc
         wkxLBpu4RdcYYPUUmhicxk4pYc1Jrv6ExzcderYMBumrCobz7RukIH+XBVKh2MACXEc6
         nZlCRRemmEX+/XwHkZCdzapZ/LbibJwoxo7ZWBbi8lh+C1ZInbQuB8A1lZg+r4Aj3k/Y
         PIJ1czKrjjuel/C20pzkiTF7A/5BNGO6qTnofM8lErtg1BfUxQ7MiLOIlO+vnLuhpQ9l
         ouDA==
X-Forwarded-Encrypted: i=1; AKwUvBxmkTC/XucZqZgZC1ac5t0ZMQmON7cTuErn6dkQ17XHRt6V8y8cnfWa4LWLS4swTheU4zOFmyOjrJw=@vger.kernel.org
X-Gm-Message-State: AFuF++mBmdudkAE8YMPJo85xHWrvrtyQstpc/1qiFL8bh59I4ilPWu1I
	r9O/435R1EpsxbOAiDTUDCgfkKkBfedSSCNA4cUDXiouxI0SWVRlUuDX3Zwa444wof3M7J6hUY9
	UFclpfANGQb1bG2aHWPyEERFHpjCQHoE=
X-Gm-Gg: AYBFou0Nbguyc1efBn8HblcdJm5MT4UABSH0Ks7i5X2EuSdKRRxpef/3hjkxSx6q7Vg
	1MHFuY9GCcLE0UTAOPygSLMUmN9W27koz2/3CgxL4i9XASrjGBOcjyUp8URZ+BC3MdHpVALFlEm
	iwX9/as6LNbBktO1zgtEMzd/W+/pC/M+1ATInORG7Y27d4bQ0dYljmNT/t2LD10LeyHzrOsItYY
	H4hjjWoh2EBitB8TzQi2v41AHcu7sgLAvg3lhd9wlsSzrx4g9+cwHOou/WnNEGk18nYWaZQIUG0
	pTSeEPkzlU6Gd9pIr8mz7x+GDrGfX3uga5ikuJ4a0UkZq2umngJ/jC8VS0oaRtvBzYordJC58XO
	DyRxiJWvtplywZPiwu6cydPSeFA9Bc6xhSD00UUIQgbSk/oyWBWJaijcqziht
X-Received: by 2002:a17:90b:1d0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39aee0e6ed8mr12609481a91.3.1788442136905; Thu, 03 Sep 2026
 06:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-6-490735672187@kernel.org> <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
 <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Sep 2026 15:28:43 +0200
X-Gm-Features: AcwNN1XsmuEPyO39jqyvRGfAMw_DGGPMkiDRHtfg1ZEoNlBhpVDCHnmjvBP_pa8
Message-ID: <CANiq72muo8SotJHJQhEe=2kiprbrQTvrEMqd1Uw_7yNSfA3Gpw@mail.gmail.com>
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

On Wed, Aug 26, 2026 at 11:29=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Do you want a link to this issue with a regular `Link:` tag?

Yeah, thanks!

Cheers,
Miguel
