Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238876;
	b=QalyU+2ID7HEhUZZKt6J+oFQCyuYbqcLA/zESY5gFO6o5qN6oA+VWAmH40rsQFTtmQqm
	 U+7RMgegbq9NXgt0VJzCulJ5arwyTVLBOx9EIXw+LCl/GVUrOfnlsTQG7NmoT3t6uNvRt
	 7NFq2E66ss+7YV6erd8YhP70HPwpe24rQqBTKZwxKo1WgyCuDeptOYWilWVS/5e55fSXc
	 6VBbBNV0SviS7csQPYIe3MkDu/APlmylH4bllmflQYuRradgsOt5vunzMWW8OzOgPAAFB
	 qOiQSyKeqqgoc7/mhj/U9xZc4/AAAm8cdayCaIN+NmGuwTQuPr6YrEfI1jFcXHGyBYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5zkgPw0DN1nFfpX9bYKLiAhgWGyCkyDFOikFQ4QOfHc=;
	b=Md0kRSqV2xWm2XNOubA7k9WKCZgfUuFlylt+q6+jKdJvQ+JWp+h57vWs8CzDyesiwI/M
	 NMavTLqlXTB0/FqTX2wM+Eff9yt8WK+T1DEu8RSayNUSwBa1Hnq78WG4w4w2mvQFXhhDq
	 ZjtfdKjr32i16Nq1JPMidwD9z49xUoaifsJOFnDncPI/s50xOd0tsyqfvnJbyToXBFy5j
	 wNLTBO+8EA3hVVwT3t98gtQg7Ax5de6K0+GQMhyzJeBmzYkT0KSb4veHiPqkUAXGoynpD
	 nh0SbvT/9pLHlV18EtvUIbFxTuYSvXrsc7NsIYCLn7zhKC4TxRq7Hl/Gq6N2KHQ/beg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYEKZ0PE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94FD606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 15:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYEKZ0PE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6615665e9.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238874; x=1794843674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5zkgPw0DN1nFfpX9bYKLiAhgWGyCkyDFOikFQ4QOfHc=;
        b=hYEKZ0PEF8EyG3CVX8wg0jgxRfFs7s/qpxUx+5vkFtY6CjOdoP97AlR82/XM/DryvK
         HwkF6tblVndngVyS81HY+WQckD0hDWFiVKONIiyr7EUvjNlLDysRjDuRz6ydWw9h1cpn
         18gbn3GcZlEclLFLI9wpazqktAib9a8e0nO2aW5wz/ZZrH9/1Qb/847rS8rDv+BrGdrR
         1NmgIneFKLlQ0ah/i5CnduVVdSpo7BEHArI0e8DdmfxoUW0kfrwQGMdo2PwdUtihuHx0
         S+BIZDZ0BC052SgfHqp6ZihpVq4dsFLD48ZNatKqKJiMSsXWeHgPeYM3+Hl1f+A1ljja
         Fy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238874; x=1794843674;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zkgPw0DN1nFfpX9bYKLiAhgWGyCkyDFOikFQ4QOfHc=;
        b=iU7q5pmXF9RuHvVmXgVICrJ5gnQYT7BovvLXp6zLQkdoH4QWNOJWEyvhFKADgCEzGF
         6zQBp9frvaSud1sSraEISkAG0qYeRmdLoOBa+CF0Su4xq1vQnvhe4OsQYgMXOuSVIRuD
         pAe8+xxtmIApLiag17HwoILlwk3ZhOKjU57yeYJ+2WzlchBmVYEQvLnGwTK+yfr7fwlL
         URc+zZabbznFjroZlnp6vZ4A5XkczhZyds17qIhmK/6vstmFXjrLca8wU8epafAwhFqn
         tH6SfyCKr9ydQnPCHJRvYe2XhFI+BeD44kBx4kGdFbXq7y4AL+bEqZz4lEIaedMUxdXf
         JJnA==
X-Gm-Message-State: APuU4Z+B7XJG04NRLTmvfUYhXO2q4MhzAv02RUBjMcPx9TRwJHibHPJe
	giyySmgD42O0k9D/gTwswReaGVnLek3UqgynIsCH0v0EYpgzDXZbuqeeWtYufQ==
X-Gm-Gg: AYBFou0LsQTF1ZC3LD+ebhTbDqxIkSYx5uoCuz3wYOXKSjoPhbkUuJTuODxcu52Vo9H
	iQvwtvzmyuKNZarruJhxaR9xtl137JW+aOqXU9CAOKmwGbutY6BYmo5ig5SH33gRSg7TYAEPJH8
	n1mdH9Z3ddu8C4xMGmSXjg2lja8q5KDrcC/qz9OS6TUdPj6joWgodRJmwTekDUegLT8mjoLibni
	wHGWAib5DqIWO8qKdowixnV4kaMl7cxU0IfVuu9Aa3XGWZR9zl0NjUPxD1fMFe5py/jN0XTKCx9
	lMeicjm1Vn0NYAe751woMvK5qgajqniUTu72U0IIwWUr0enh8D/hf3T0ybA+yTs0+9xXyxhw9lK
	HDcHzmUU2zfaOdmrVOewdE8xTJF2kojBzYOoGkXbzhjvK1Ou6ZYlY/u5RYnrlJw3ZYAnjqw8BN1
	xUYFVJiPPHJlhRUQtYDL0hb7EB1inkuSq3JXcI0BRTsofIEr/0MMwnKg1WQjKdr1f9Z3RRz1rR1
	QWIZR5LmvfCe1QUzzdWb7SctnnEK9aZ/FoPcwubFjcml+DG4SJUQr3xkpyLcvmbnVRwoTCzxmZy
	C5Wn6Pi4onMOmre0d0ZSjbGCkbpw1OZPsuGA2Zl4RuVHKSKJm2o7JFHzyNNoUcKgz8BK
X-Received: by 2002:a05:600c:3111:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b94d75ec90mr86243035e9.1.1794238874098;
        Mon, 09 Nov 2026 07:41:14 -0800 (PST)
Received: from mika-cable-reply.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb76697sm144416935e9.0.2026.11.09.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:13 -0800 (PST)
Message-ID: <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>
Date: Mon, 09 Nov 2026 07:41:13 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
In-Reply-To: <20261109153955.GU176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
 <20261109153955.GU176724@black.igk.intel.com>
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

Hi Mika,

On Mon, Nov 09, 2026 at 04:39:55PM +0100, Mika Westerberg wrote:
> We could still look at the PORT_CS_18 but the driver log already tells that
> it is in TBT3 mode. What kind of cable you are using? Is it short TB4/5
> cable or something else?

It is a short Thunderbolt 5 cable: StarTech TBLT5MM50CM240W, 0.5 m.

One retimer enumerates on the link, 1-0:2.1 (vendor 0x7fea, device
0x1032, "retimer NVM format of vendor 0x7fea unknown"), and it goes
away when the dock is unplugged. I haven't been able to tell from
Linux whether it sits in the cable or on the DEG2 board.

In case it is useful, here is PORT_CS_18 from both ends, read just now
(same boot as my last mail):

    $ tbdump -d 1 -r 0 -vv -a 2 -N 1 PORT_CS_18
    0x00d2 0x00002f00 0b00000000 00000000 00101111 00000000 ../. PORT_CS_18
      [00:07]        0x0 Cable USB4 Version
      [08:08]        0x1 Bonding Enabled (BE)
      [09:09]        0x1 TBT3-Compatible Mode (TCM)
      [10:10]        0x1 CLx Protocol Support (CPS)
      [11:11]        0x1 RS-FEC Enabled (Gen 2) (RE2)
      [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
      [13:13]        0x1 Router Detected (RD)
      [20:20]        0x0 Cable Gen 3 Support (CG3)
      [21:21]        0x0 Cable Gen 4 Support (CG4)
      [22:22]        0x0 Cable Asymmetric Support (CSA)
      [23:23]        0x0 Cable CLx Support (CSC)

    $ tbdump -d 1 -r 2 -vv -a 1 -N 1 PORT_CS_18
    0x00d2 0x00902f01 0b00000000 10010000 00101111 00000001 ../. PORT_CS_18
      [00:07]        0x1 Cable USB4 Version
      [08:08]        0x1 Bonding Enabled (BE)
      [09:09]        0x1 TBT3-Compatible Mode (TCM)
      [10:10]        0x1 CLx Protocol Support (CPS)
      [11:11]        0x1 RS-FEC Enabled (Gen 2) (RE2)
      [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
      [13:13]        0x1 Router Detected (RD)
      [20:20]        0x1 Cable Gen 3 Support (CG3)
      [21:21]        0x0 Cable Gen 4 Support (CG4)
      [22:22]        0x0 Cable Asymmetric Support (CSA)
      [23:23]        0x1 Cable CLx Support (CSC)

(The wake status bits and TIP, 16-19 and 24, are 0 on both sides.)

So both ends are in TBT3-compatible mode, but the host side reports
Cable USB4 Version 0 and Cable Gen 3 Support 0, while the DEG2 side
reports Cable USB4 Version 1 and Cable Gen 3 Support 1 for the same
cable.

Thanks again for your help with this.

James

