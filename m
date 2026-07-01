Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A03F5BD3;
	Wed,  1 Jul 2026 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898921; cv=none; b=ColhYpsOvG1MWqw/0nJA7u5pHFK53OnowdvHqbAvV0/J8XI/YfjWg0aN6JrqeASEAVVb9YHoztdAtJUrIL7pIte/anUVLlK/WmTZHXF8yExNB6TD6WHZHtQI7cf6I9zw3uOtt+7a3c7dE4cLfUJTlaVUPrNgjSu1nPyYNV37FzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898921; c=relaxed/simple;
	bh=sqlU3WbIlHqXv0fVvQ0elHrvCeiaZX7mfyapQblBwXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XH5VH2M9gbmzwH6xacz2WtqtQlVnZt0HTwuwY0xqQGYifdtPNPlM/2JCaLWw1L1wo6IBIz0VL3qHVUEder6XTFHmcDoDS5hBvnHnyXoAtBlt6dTT50+ZOyx2UxDhin5mzTqHjePolLHu6ZhIPYGMK92sierKtt7UfCG4jasqDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqERfpti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqERfpti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34201F000E9;
	Wed,  1 Jul 2026 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782898919;
	bh=e0uy7x/pJ79r/rXJ+9S9E9BL/ogclOfY0Gy5f24mEKI=;
	h=From:Subject:Date:To:Cc;
	b=aqERfptiIxjejW8vzKWxznsIUYrh+beV8btiu6X1UlMJSP2L/oLkqvqJcf3pW5GHH
	 j/vB7c6j+GdGvphhLqwQ/7BMe5P/al7wLvn5diuBGtnn8fyaQug5OPd9hGfcRTTT8f
	 MQKAGQRfkkZfNto+ZpWoJId7sSTXuh+nLJseOCsQ91Axgto8HxbGbSv9UmrOLIEkAr
	 uzkq5na7eGPRr2w5rXxew5VaUrYptTLtnbRmhLQvhKE1p0G+h2Ndpqmh1idc45+PLY
	 uZmMOY2qZtJ3f+AmZu1PDhgQMQPoX5h65NhrH1ndzje8BzndQmwyfZHJzBk/WrF6Qp
	 z8aFUDw27lRoQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH v2 0/2] USB: replace __get_free_pages() with kmalloc()
Date: Wed, 01 Jul 2026 12:41:49 +0300
Message-Id: <20260701-b4-usb-v2-0-272807df4b64@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3gRGoC/zWOTQ6CMBCFr0JmbU1pCxhX3sOwaMsIVVPIDBAN4
 e5S1OX38v4WYKSADOdsAcI5cOjjBuqQge9sbFGEZmNQUpWyzEvhjJjYCael8haNlKaBzTwQ3sJ
 rL7rWX+bJ3dGPKZ0czjIKRzb6LkkJk9wFHnt67wfmPMV/W1r+t+ZcSHFqClMpXXhdmcsDKeLz2
 FML9bquH62+4ezGAAAA
X-Change-ID: 20260616-b4-usb-b302cae4004d
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mike Rapoport <rpppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-usb@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.16-dev

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
v2 changes:
- rephrase the sentence about unconditional kfree() to make it clear why
  it is safe
- don't include <linux/slab.h> in ohci-dbg
- fix name of debugfs directory

v1: https://patch.msgid.link/20260630-b4-usb-v1-0-8d547235c374@kernel.org

---
Mike Rapoport (Microsoft) (2):
      usb: host: ohci-dbg: use kmalloc() for print buffer
      usb: core: devices: use kmalloc() to allocate dump buffer

 drivers/usb/core/devices.c  | 7 ++++---
 drivers/usb/host/ohci-dbg.c | 9 +++------
 2 files changed, 7 insertions(+), 9 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260616-b4-usb-b302cae4004d

Best regards,
--  
Sincerely yours,
Mike.

