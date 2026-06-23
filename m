Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235503845B3
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 00:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174744; cv=pass; b=upIH0ledz5/iRk3NuKV/5dUK5CJxi7dkO1Zq5tDO5wOvunFAS9gSa5JqXlNVxnGdBiVbIKf3FXEaFe8aP06Ff0ZvGk2ribOeDWdHlRP03Z0wYTv0Q9m4P7xb3+9sP8ho7kS5trWdr0i0YmxGOp++HsncBiopflkOXP1hmGxHt0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174744; c=relaxed/simple;
	bh=IY7BvNJy5YUJHRWxxgD+VTRpDgXM+4I9yayLCBMrVDU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=F57a5XCSruIIJzdArKatRw+lSNdGpwfCNEcSk3xQ22MBdNpwe9XczU9cOLCkptGykHDymg7pi7+lCgu255gfxuq8HpIBLWBm62kY/ZvgoPwfzeUE8/mea2/gNR88gXAkx4UoPiVrZn3sgea80fujAn3sVQJHQ6AmHKZTTNUBg3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8zTfSSN; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8zTfSSN"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8de6adb2357so6237046d6.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 17:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782174742; cv=none;
        d=google.com; s=arc-20240605;
        b=j65ZLGXDHZq470IO3yNI1mO5Wop08Woaxb3hLXh246wIKDRoZ3HU02ItN2NVRvx2vN
         B6+PKv5FBKB1ApHrvInoLAktKG/3U9qFjF9HrtTIphCCZufC/dP0165OQNsmSxBManpk
         ctfA48slLTuDtwb3i9FZi1Z37vDiFitpi/6Z3zwQK+3KI9jZPmqHdpbcOjLx0cPgZmDu
         umLs2G5KDkeZ/jBoLL+FmXBx1g6W6m4pD4tML9EV/aE0wXbPjeuYW+fHPsxhztglA56e
         02uCjLQYA87LAQ1y1lqUPA+FCA6q/7uvXl9uM+zIIXUsaswpxojyJ+bM/EcvWbkMCgwo
         6vHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IY7BvNJy5YUJHRWxxgD+VTRpDgXM+4I9yayLCBMrVDU=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=CCK3kPg6NXOS3WXRT34sqEgFO1/+8O/PduhKn9FlAKTaN+ac/9x52x+G8Pqwgus0C2
         dMv9aWyalJBegR4ViaHHzhtjAOEl4b5d10Cmnrio9Y6UQycmkAbUQ76e5piiPQeZMhYK
         qR7wbq+Y6NUponQE4M/UrXxZASoxOSIYNr4p3Ahr/UO3TqHNcyEsV64iQPKo9NFoXTM+
         XtjfKr9Y7BsEoiSAzzgypFWp4OlAyuk6UUiuFkjWWcm/rmmtCzduHQ9JNHMgmsRwvzaC
         vj9zGvBKP1vraZup/dHjZ8mZiV0sMQe1nTpSKkIXDtiBPp1rWBp7h+CRsaNBXZHXPU7H
         /ArQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782174742; x=1782779542; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IY7BvNJy5YUJHRWxxgD+VTRpDgXM+4I9yayLCBMrVDU=;
        b=F8zTfSSNDU3Zi6aRDcqKtGm4OrrlL8I5d76kR3j5HhLWJo1tpwq5nh5etjejUwWnxb
         1HNcVwyNH453gEJT+VL1SP3OY5eOKdobQnZK80MmAZyC/Q4NgzT9/4WKS1PVShr2ccBq
         7IGjWD8e+R9QT74kg1yBsVhhm5TagdcqRfVb2fRWhBsYynXHQXUZAgyp8I7z9s1MsBLW
         cQG299dJtsVgs5rS6cOmW9dx3v3EAj01kzXGr1WkUTPhE9hspm1mTBHXM8vih0NVcEfI
         ZsYaCp/dnqIySsHF7ZqPMxXePI/vUzj2zb/QUsFokALxzpoBXoF17ziojy0/jvd3BiY6
         Y/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782174742; x=1782779542;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IY7BvNJy5YUJHRWxxgD+VTRpDgXM+4I9yayLCBMrVDU=;
        b=BgdqwhzDokmZJ1iAmFMx+wIG66r56xNpTcP4+SkcJubYEDTkiSEvAg6BV4qHKJnKm7
         l3pGw+wlMN6tuK7EkrcuToCVueLPSCPhSozDKlZsTiZy0csXMX4jPKVQ0C6efQ29uK4+
         z01+JrTelBCYyg+JrguOk4/KylPb9I/pA1f4XBVxmwNjEoe+v94dOb4zy69qMVvjNzTM
         pnv/rbBub3VO/xzH8BGEWDfhi0rLFK2uzliw0DhGfDGZ5cve3RD/7L8tG/S3OQtwUTKZ
         +jbiuzokvUaFNjcnV0zYJMQsK7IXjl0AUIeajUo3/BX0ZuK3ruAMFLLmg0aPy6g9Ezrd
         n8yg==
X-Gm-Message-State: AOJu0Yz+KUWGZNjD0v/sOO0LMPKl8F0vf2FqY4NR6SQe80bkdZ88GJjf
	5GUKkZCO45Pc69E32EchNsXz5gg6qPAW2Bpqwu1MQdPQOUNDZExmvzkoC/j/5gxLxTMFgRTf2dO
	tVWHXIbCiOO/ZS6PgmJWxU/fBC7i8238zLVkYaGs=
X-Gm-Gg: AfdE7ckguuFP0+qE/rH0clel7ZgDF/O63PDmxlXE2i9mm3vgKVo8XjNLMm6jitr71SX
	Bkp7uzkLimOk9dA+MB7AToSf9UbGipNfd4EvBV4bWPZ52CoInrPTACERuIhfNBeHJlhgMqDsrUl
	SuFOzSm2YCrTwGGmLmWWYO5qQnrlXSj9S5e0BzYlaYblBKpepeN3OMyPqwzmEkSIb7Z4KAvn2+N
	rHiQmnBYDfQr8QYvfxVrkyjcnmSzip9BWru067PdOTTP+kfIDAFPQ2aK+mrGwh+aTZ9zlXbQb4=
X-Received: by 2002:ad4:5d45:0:b0:8dd:1779:4d1d with SMTP id
 6a1803df08f44-8e37026277fmr37832176d6.2.1782174742068; Mon, 22 Jun 2026
 17:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aditya Upadhyay <adityau930@gmail.com>
Date: Mon, 22 Jun 2026 20:32:10 -0400
X-Gm-Features: AVVi8Cd0G9gNZXcbLBEacGL0GMZUtsbNor1P7r_BBMbDzcry641GiRQK_EyvplE
Message-ID: <CAAF7Zqye8YCxpCXcVPbAQzsAiF7upRySyFP959Wio+07rRS5nA@mail.gmail.com>
Subject: ucsi_acpi: USBC000:00 repeatedly fails to re-enable notifications on
 ASUS Vivobook S 15 M5506WA
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hardware: ASUS Vivobook S 15 M5506WA_M5506WA (baseboard: M5506WA)
BIOS: M5506WA.316
Kernel: 7.0.12-201.fc44.x86_64
ACPI SSDT: AMD CPMUCSI v02 (INTL 20230331)

Both USB-C ports are enumerated at boot (port0, port1 visible under
/sys/class/typec/). However, the second port (port1) does not charge
when a PD charger is plugged in.

Additionally, ucsi_acpi repeatedly fails to re-enable notifications
throughout the session, likely after suspend/resume cycles:

[Sun Jun 21 17:22:25 2026] ucsi_acpi USBC000:00:
ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
[Sun Jun 21 17:22:49 2026] ucsi_acpi USBC000:00: failed to re-enable
notifications (-110)
[Sun Jun 21 18:23:22 2026] ucsi_acpi USBC000:00: failed to re-enable
notifications (-110)
(repeats throughout uptime)


The workaround is to reload the module:
sudo modprobe -r ucsi_acpi && sudo modprobe ucsi_acpi


After reload, both ports work correctly and notifications are restored
until the next suspend/resume.

No relevant BIOS updates are available from ASUS for this model.
