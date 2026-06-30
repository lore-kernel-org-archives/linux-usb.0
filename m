Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391B25B09F;
	Tue, 30 Jun 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815238; cv=none; b=C2Wp//g1xY40G6mQ6Nh/oPIABuaPkAlJl81xxSh3QK9ZTKoKIDHioA0TKHxCawiqH659XbVQVLK1G+b6AvvekdlNV1hwRVPvzEt5gM2bDCXaUh3CbMvPdovDgnx/vGaYhYTHGsLIlX6gS8PR23jIbUV5TNk8X3jw7+7WzMKkHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815238; c=relaxed/simple;
	bh=9GbKR8ps1ESxpvxVxVlLrVMo7MKVnUnbwmMwCrmWBj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A0e/lgAUlP8f60KDYzm6Xkxi5KaAB9DeVZCEtsqW970G8KCMSQb5ksA9EaNHHmQuIN9bWQeHXwLA3ApazB58JDbKXO5Jw2GyZh73LNdu3tnmob5jbQ6JzWWZL1bVPG1UATLIWvmDApAUtFnYz58Gvokt0Y24s8jmcUMqdDnt0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ij0/X3OB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ij0/X3OB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8490A1F000E9;
	Tue, 30 Jun 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782815237;
	bh=+nYWrX07JlaFQzXJIQgj7pMrZxgun/XWbsUf+czLcVM=;
	h=From:Subject:Date:To:Cc;
	b=Ij0/X3OBsv649sZ8kUBK6iRv04bfxCQxZGiGivCgRzUNKGeChGY+I0CCIa9sghyEc
	 jMrnPZauWJQqdYAqzmbKDLhMyM5mbK6fpZ4X6y/y2GfnT3G10Oxd20S9b9SR3iyQzL
	 ll9EepMUa5oiFSwf2gryT8CzTFwIRnhbsCg7oMx7oagY3kgPlXp/cEYKGURy+Sdgdk
	 wEjsO4KcsAMqCY9XTmrHwRKA5n/2jq1vT7paXv5V+pZK8rY999MXTwj1vFeiZCi5nK
	 kgdApegIUZh7szoho2xgHudVWOR7H6HvaWCOEP/soHPG5jGWEviVA1xqpZoyzR+d2N
	 Rz3nEbH++LePQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/2] USB: replace __get_free_pages() with kmalloc()
Date: Tue, 30 Jun 2026 13:27:07 +0300
Message-Id: <20260630-b4-usb-v1-0-8d547235c374@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPuZQ2oC/yXMsQ6DMAwE0F9BnmvJpFEGfqViiIMp7hCqGKpKi
 H9vUsZ3ursDTIqKwdAdUOSjpmuu6G8dpCXmp6BO1eDIBQp9QPa4GyPfyaUonshPUMvvIrN+/0e
 P8bLt/JK0tXVrcDRBLjGnpUWNcJ4/kEcGLYEAAAA=
X-Change-ID: 20260616-b4-usb-b302cae4004d
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-usb@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.15.2

This is a (small) part of larger work of replacing page allocator calls
with kmalloc.

My initial intention a few month ago was to remove ugly casts [1], but then
willy pointed out that Linus objected to something like this [2] and it
looks like more than a decade old technical debt.

Largely, anything that doesn't need struct page (or a memdesc in the
future) should just use kmalloc() or kvmalloc() to allocate memory.
kmalloc() guarantees alignment, physical contiguity and working
virt_to_phys() and beside nicer API that returns void * on alloc and
doesn't require to know the allocation size on free, kmalloc() provides
better debugging capabilities than page allocator.

Another thing is that touching these allocation sites gives the reviewers
opportunity to see if a PAGE_SIZE buffer is actually needed or maybe
another size is appropriate.

For larger allocations that don't need physically contiguous memory
kvmalloc() can be a better option that __get_free_pages() because under
memory pressure it's is easier to allocate several order-0 pages than a
physically contiguous chunk with the same number of pages.

And last, but not least, removing needless calls to page allocator should
help with memdesc (aka project folio) conversion. There will be way less
places to audit to see if the user was actually using struct page.

Also in git:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/usb

[1] https://lore.kernel.org/all/20251018093002.3660549-1-rppt@kernel.org/
[2] https://lore.kernel.org/all/CA+55aFwp4iy4rtX2gE2WjBGFL=NxMVnoFeHqYa2j1dYOMMGqxg@mail.gmail.com/

---
Mike Rapoport (Microsoft) (2):
      usb: host: ohci-dbg: use kmalloc() for print buffer
      usb: core: devices: use kmalloc() to allocate dump buffer

 drivers/usb/core/devices.c  |  7 ++++---
 drivers/usb/host/ohci-dbg.c | 11 ++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260616-b4-usb-b302cae4004d

Best regards,
--  
Sincerely yours,
Mike.

