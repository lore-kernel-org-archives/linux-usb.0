Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174346;
	b=A7G01T6lBZ0ElqABjF/1VrwfXENM2qqpeGtkQ9YQSGBX7FaVtp4LB2i7YHw2J2aX34Wi
	 Aamzi/AVEjVzH9emd8qOW0/mhLJQkMA0OCPADUDUSriS2157Z7V6OSayZyhgVFzfjIZa2
	 QRmPU+aosVBLKWRgnL0zhpL+bShkKh3eG8xdBsiFeq5pqyW0vULBqa0LTYcOWSljSfFKC
	 CzYJqCn8W+x5H9Yao/hyGz2qF3bX9wJiNSLbwNVmW7onQyhNtIgGdgSUQY+wiHxkWBhnv
	 6kFCMebmurw55ElQ1CDyg1rhBp6MllfiME4m2lZ9vXcbKLXoMIuo1rIwNpYR/spZLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rQ5M/egh3irMjrbocw1q9ggI+9luFCL+5wWsNmpgU2A=;
	b=XpRLmW0UTxRgGDcfY65UjlS6NaJu9jVQmaJgaN542Q3F3HNTL2VlzXz3ynbLE7c6YPWi
	 LMasY0k2CGt4/m/9gzuPo4+o9HE+6fP6o4SmD+7kYcNvefac/uer0OGuCz1KQXkLWcK7d
	 E1plauNgBF4danvEA9H1EStrFJVoNhHlIzReNwi5ssEcaiYE1Mruy4/UtYPUnPsYu3dNU
	 rHdO969Vsk7x9hyHd3XKfjsoejLrtfgurNbeNDY8awACAIg5Stl/dxs5lzTisJ0wY+g+R
	 /id6kt96bQvr0ZxNg0na7V9oEt3uyn2UP2fjWc3BbzR49dBHyURNiTP3eJyfJrffThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rHH5mBAv;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F20606A326
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rHH5mBAv
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2efe0e3bdceso3220275ad.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174345; x=1795779145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQ5M/egh3irMjrbocw1q9ggI+9luFCL+5wWsNmpgU2A=;
        b=rHH5mBAvnCyf5BVeI/8RbDkS5YUknOHEdPZvIF8FKjxdvbbWZPbnhXk5b+fqIhITkh
         MXOj5OkHp1R/Gv8C1COn2AKCQfksjkdOn6H198NvlvyOBxsjEgiaSfeCbyHJaCF1PsZD
         2/p0QII9PkM/n8fgae0jCtGPMOoGxk0qHiBxb4rVLu+PvU+naG6XweH/ZAOIO+lonTXN
         kSeRC9HknBYJafcdmNytNF/iNVoh3LNLn0Xy8k/bjfK4R1g8Wn1Q+45qz0fA2W4OR+3n
         t0jAhND84haBEwfyhnkfY2S8kRCZOV85cPMqlY44l5E0ckcCDlY58PvEF0jTHtENXAsO
         weqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174345; x=1795779145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQ5M/egh3irMjrbocw1q9ggI+9luFCL+5wWsNmpgU2A=;
        b=A77r9uKagXqK4CWKfXlx2FFv6nRAshD2r8QkuHNLfxW/VMUqJVOATA1/82DZbSliNp
         VcN8Kd8zW8gn1veVZ5e/hhePDtNsVxB/qZ0ZHiEMmeLHYWaZZLsGaE4mmUwUeXoamw1h
         FQ2qRVnWuXgEdxNN9Hmfx1xku0yuEWBWyBdC1b3Cecjt/3naG5L4pEO9NUXEjZZRn6oO
         wl+VAF+isRFFENYPfIdIjD4V4GQQw5nIhxWhHT6S/ygo2VV0tGeRF5UhF6omnAH0KKBR
         cJ28W8JwflECTwCOE1B3FcUqDxxTaTMjJUvDOtZtArsCiHKhp/h8N+ak5qS6DKqcMWTZ
         nouQ==
X-Forwarded-Encrypted: i=1; AL+hErFIG9WhrGy/5KLg4ov5Uc0mT/yCByjV9fDcs4MsqF09IVIhrqUbmJYu2ZiMhKVeD1wBI8MKsxc5osM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BRpxaWZ/5WQRJTpnz2rmdlMEg+pryST+ab9slcBk1sv4CQQ6t
	iBX9gEEJ7AQ6hpUqKRqVuggTgUar1+JyWodk3eXpDoPK+lVv43BfZgFFCnB9J34XXFg=
X-Gm-Gg: AZFdTZfWXp9iZ+YL/CnpdX7qJFXaqvV4gPQEDu6iwymSvy9tbhcjok1z1y3ZKVPrHhn
	9ajMlPpd0+XYA9A2nxKxtHToTtbflD5QKTDHFzO4DIMQvJXJp4ht+pMxBoWbFRXA1HZ7pejo/Fd
	jGQxsQtlGD4Yg1txiztrn3uy0h1oXqfUcRwqttK0sak+Gh+KzkrRJaiefB4qXmWaF212cDV6xir
	JYN7Omm6RjY6XS9kJqIVYU9dWmv8uOqFbFN0jakUOeDWeZo3qjRVbzHxtEn8usP+PUaNa6Kwy0q
	4Tnv0G9BDv3BIqG8ywen6Pq2I2rIePMWMUZBFXLylVmdp0j7WU0tmMf2CL5nfN8waDyztlgDTsN
	0WWkpjZ3R1BkHH0Azvy1RIb8SlXEBaJr+LdnBnCEvjy6BetD8kVwShFaQm09+DrI4eLDMo7+TYh
	3csvlxBIqZzMBhqVJ0PZzfRX2FPt0ADQqaOEpGl3REmQJkNcp+o4Ut8uddOgAx7+euFWeSKviCc
	zu02FymHwBwGrm5tZcHKFAUYunFdmxDgS1pmOYwsQDIFsflp+WJODZzfPvwL2s7FSfa5FZ9FOAM
	9kQP284KqS99wXiDCTs6IwGt4aH/LZl7T2VZrpEuDNuzhs1SmPI0da/S4j+R6sIcKqClm9Gjljp
	x5uDErhq/SvVI/NIDuiDc86dK4LhYHxbOIneP
X-Received: by 2002:a17:903:3d10:b0:2f0:2250:7abd with SMTP id d9443c01a7336-2f03f17662cmr28672825ad.10.1795174345126;
        Fri, 20 Nov 2026 03:32:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm13247705ad.10.2026.11.20.03.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:32:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nkapron@google.com,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 2/4] usb: gadget: f_tcm: zero the CBW buffer the status path sends
Date: Fri, 20 Nov 2026 20:32:16 +0900
Message-ID: <20261120113217.3063855-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112008-parakeet-unblessed-17ed@gregkh>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr> <20261118124005.2428068-3-yhlee@isslab.korea.ac.kr> <2026112008-parakeet-unblessed-17ed@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 11:55:22AM +0100, Greg KH wrote:
> On Wed, Nov 18, 2026 at 09:40:03PM +0900, Yehyeong Lee wrote:
> > Hui Peng's multi-driver fix of 2026-09-19 zeroed this buffer too; the
> > reviewer asked for it to be split per driver and it was not applied.
> 
> Why is this line in the changelog?  It shouldn't be.

Sorry, I wanted to credit Hui's earlier patch, which made the same
change.  I'll drop it from the changelog in v9 and mention it below the
--- line instead.

Best regards,
Yehyeong Lee
