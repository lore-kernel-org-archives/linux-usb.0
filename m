Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142478;
	b=CPNL38xtmT0SsoGx+HDZxfDgG5xljTQGcpkYHHeeHH47sR44HR4+qg3qAop9bP/Fziu2
	 CaGfpEpkZMjIgHbqqsAQ0eBhup5+KxW405UXI0Dxr1OwRD6WssfufB4XlcHhlTvRfVCVS
	 oPzkcEPeJrt+Bi6LD10/WJV/7sCUzxq3XxIYskCyjVdg/W4il7VkDp7Mb3A3BMXfhiQdL
	 94f+t8/6RV8plnHAhqQeL+e0gGlyIIS4bad/gocT3mzmrnQ8pwTAm1F4fDkwJbI7DqeI0
	 beFyeBh9wipMq5/9sGOv+4uPyVIClekrUgr3uP0XWVn2aMJ8NyPbESbv6lAX/zkAv6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142478;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mW3Em0iA2hYYVLKztj+U8IikgZdoinf4Yi4Et9IH+C4=;
	b=jjkNGRJUW6fSiRQ158sPJf9y60dz9CZ700bzA4HOfuAXHpdFWkCqthTpVFZ3aGCi4CxT
	 /D2lV3k9U27RKIj5sez9zbW7peW1udRA3tu4KgeK5W5u6ltygmjiJwXLVqoTKBanXW7/v
	 WqrMGzFPZukfCCE7W8I89kHRmSIy2yZNMmKqpVsABMsJ7gHRk9F59vKAnwY0sTqXpY2oI
	 x9OU/ypOGClCUtbwcFiX9zMpyqxn/sMd2iUZzO1pJKbL+lYeVvbAYbRLztEA9xBiJv4ve
	 MW5ZXcWPltRfR1Boz2RBYvHxh2wL5XKURB5q7MnXfj1HbXfPdO9tilDqh5MnoN/+w/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771B606A320;
	Fri, 20 Nov 2026 02:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6771B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d8d6ae20e48b11f19a56ed5b684f684d-20261120
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:04a7e469-317a-406a-8d52-6d12c1b166b4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-24
X-CID-META: VersionHash:7db8b62,CLOUDID:094989808ba1916dd20ce45fdd38798c,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d8d6ae20e48b11f19a56ed5b684f684d-20261120
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 830320747; Fri, 20 Nov 2026 10:41:11 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Alex <alex@alstergee.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH v3] usb: typec: ucsi: do not register UCSI on Lenovo Legion Pro 7 16IAX10H
Date: Fri, 20 Nov 2026 10:41:08 +0800
Message-Id: <20261120024108.3428193-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5ee36c74-54a2-4fc1-b4bd-61a1d8342c2e@alstergee.com>
References: <20260902090531.2134150-1-huangwei@kylinos.cn> <5ee36c74-54a2-4fc1-b4bd-61a1d8342c2e@alstergee.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 19, 2026 at 02:24:25PM -0700, Alex wrote:
> I need to correct my earlier report and withdraw my Tested-by on this
> patch. Please don't apply v3 as it stands.

Understood, and thank you for the honesty - this is exactly the right
way to handle it. I'll withdraw the v3 as well (Greg: please drop it,
the premise no longer holds).

> - The drops happen with and without ucsi_acpi bound, so the
> driver is not the cause. Skipping UCSI on this machine wouldn't
> fix the problem, and it would hide the typec/PD information.

Agreed. And the Windows comparison is the decisive data point for me:
the stock Microsoft UCSI client (UcmUsciAcpiClient) drives the same
PPM on the same firmware and charges reliably, so UCSI traffic per se
is not what disturbs the EC - which removes the entire premise of
this patch, not just the tested outcome.

What remains is an EC/ACPI-level problem where something Linux does
(or doesn't do) differs from Windows. The burst of
acpi_os_execute_deferred hogged CPU warnings lining up with the drop,
and the EC itself losing sight of the adapter (ADPT clearing in
0xA3), both point below the UCSI stack. The Q7CN44WW/Q7CN78WW BIOS
span and the "power cycle always recovers" pattern suggest an EC
state machine issue that Linux's event handling exposes.

> I'll keep working on it and will follow up on bugzilla #221142 with
> data rather than conclusions.

Sounds good - keeping the bug open and data-driven is the right call.
One suggestion if you capture more: an EC transaction trace during a
drop would show whether the storm comes from a GPE handler, a polling
query, or a buffered event burst - that would narrow the Linux-side
suspect list (acpi_ec polling vs GPE vs the lenovo_wmi/ideapad
helpers you listed) quite a bit.

Thanks again for the correction and the detailed re-test - better a
withdrawn patch than a merged wrong one.

Huang Wei
